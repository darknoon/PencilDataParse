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

func describeDrawing(_ d: PKDrawing?) -> String {
  print("describeDrawing \(d.debugDescription)")

  if let d = d {
    return d.dataRepresentation().description
  } else {
    return "No drawing"
  }
}

struct DrawingAsFile : View {

  @ObjectBinding var drawing: PKDrawing

  var body: some View {
    Button(action: {
      print("Pressed da button")
    }, label: {
      Text("YOO")
    })
  }
}

struct DrawingInfoView : View {

  let drawing: PKDrawing?

  var body: some View {
    VStack {
      ScrollView {
        Text(describeDrawing(drawing))
      }
      Group {
        DrawingAsFile()
          .padding()
      }
    }
  }
}

#if DEBUG
struct DrawingInfoView_Previews : PreviewProvider {
  static var previews: some View {
    DrawingInfoView(drawing: nil)
  }
}
#endif
