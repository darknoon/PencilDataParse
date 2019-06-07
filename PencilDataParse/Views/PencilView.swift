//
//  PencilView.swift
//  PencilDataParse
//
//  Created by Andrew Pouliot on 6/7/19.
//  Copyright © 2019 Darknoon. All rights reserved.
//

import SwiftUI
import PencilKit
import Combine

class CanvasDelegateProxy : NSObject, PKCanvasViewDelegate, BindableObject {

  var drawing: PKDrawing? = nil

  var didChange = PassthroughSubject<PKDrawing?, Never>()

  func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
    drawing = canvasView.drawing
    print("Drawing did change (delegate): \(drawing.debugDescription)")
    didChange.send(drawing)
  }

}

// Don't really like subclassing things, but don't want to have to make a view and manage its subviews either
class MyPencilCanvasView : PKCanvasView {

  override func didMoveToWindow() {

    if let window = superview?.window, let toolPicker = PKToolPicker.shared(for: window) {
      toolPicker.setVisible(true, forFirstResponder: self)
      toolPicker.addObserver(self)
      self.becomeFirstResponder()
    }
  }
}

struct PencilView : UIViewRepresentable {
  typealias UIViewType = PKCanvasView

  @ObjectBinding var model: CanvasDelegateProxy

  func makeUIView(context: UIViewRepresentableContext<PencilView>) -> PKCanvasView {

    let win = UIWindow()
    let toolPicker = PKToolPicker.shared(for: win)

    let canvas = MyPencilCanvasView(frame: CGRect.zero)
    canvas.allowsFingerDrawing = true
    canvas.backgroundColor = UIColor.brown

    canvas.delegate = model

    if let drawing = model.drawing {
      canvas.drawing = drawing
    }

    toolPicker?.addObserver(canvas)

    return canvas
  }

  func updateUIView(_ canvas: PKCanvasView, context: UIViewRepresentableContext<PencilView>) {
    print("Update UIView... model: \(model)")
    if let drawing = model.drawing {
      if canvas.drawing != drawing {
        canvas.drawing = drawing
      }
    }
  }
}


#if DEBUG
var model = CanvasDelegateProxy()

struct PencilView_Previews : PreviewProvider {

  static var previews: some View {
    PencilView(model: model)
  }
}
#endif
