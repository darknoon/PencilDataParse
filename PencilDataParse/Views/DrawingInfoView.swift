//
//  DrawingInfoView.swift
//  PencilDataParse
//
//  Created by Andrew Pouliot on 6/7/19.
//  Copyright © 2019 Darknoon. All rights reserved.
//

import SwiftUI
import PencilKit
import Combine

func getTempURL() -> URL {
  let idstr = NSUUID.init().uuidString
  let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory())
  return tempDirectoryURL
    .appendingPathComponent(idstr)
    .appendingPathExtension("drawing")
}

func saveFile(model: CanvasDelegateProxy) -> URL! {
  guard let drawing = model.drawing else { return nil }
  let data = drawing.dataRepresentation()
  let tempURL = getTempURL()
  do {
    try data.write(to: tempURL)
  }  catch {
    print("ERROR: couldn't save temp flie. handle this \(error)")
  }
  return tempURL
}

func describeDrawing(_ d: PKDrawing?) -> String {
  print("describeDrawing \(d.debugDescription)")

  if let d = d {
    return d.dataRepresentation().description
  } else {
    return "No drawing"
  }
}

struct DrawingAsFile : View {

  @ObjectBinding var model: CanvasDelegateProxy

  @State var visibleFileURL: URL? = nil

  var showingFileURL: Bool {
    return visibleFileURL != nil
  }

  func pressed() {
    self.visibleFileURL = saveFile(model: model)
    print("Pressed da button \(String(describing: visibleFileURL))")

  }

  var body: some View {
    Group {
      if showingFileURL {
        FilePresenterUIView(file: visibleFileURL!, onDismiss: {
          self.visibleFileURL = nil
        })
      } else {
        Button(action: pressed) {
          Text("Share as File")
        }
      }
    }.disabled(model.drawing == nil)
  }
}

struct DrawingInfoView : View {

  @ObjectBinding var model: CanvasDelegateProxy

  var body: some View {
    VStack {
      ScrollView {
        Text(describeDrawing(model.drawing))
      }
      Group {
        DrawingAsFile(model: model)
          .padding()
      }
    }
  }
}

//#if DEBUG
//
//let model = CanvasDelegateProxy()
//
//struct DrawingInfoView_Previews : PreviewProvider {
//  static var previews: some View {
//    DrawingInfoView(model: model)
//  }
//}
//#endif
