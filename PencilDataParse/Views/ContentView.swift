import SwiftUI
import PencilKit
import Combine

struct ContentView : View {

  @ObjectBinding var model = CanvasDelegateProxy()

  var body: some View {
    HStack {
      PencilView(model: model)
      DrawingInfoView(model: model)
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
