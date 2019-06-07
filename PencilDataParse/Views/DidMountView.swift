//
//  DidMountView.swift
//  PencilDataParse
//
//  Created by Andrew Pouliot on 6/7/19.
//  Copyright © 2019 Darknoon. All rights reserved.
//

import SwiftUI
import Combine

class DidMountUIView : UIView, BindableObject {

  var isMounted: Bool = false

  override func didMoveToWindow() {
    isMounted = self.window != nil
    didChange.send(isMounted)
  }

  var didChange = PassthroughSubject<Bool, Never>()
}

struct DidMountView : View {
  var body: some View {
    Text("hmm")
  }

}


#if DEBUG
struct DidMountView_Previews : PreviewProvider {
    static var previews: some View {
        DidMountView()
          .onAppear(perform: {
            print("on appear")
          })
    }
}
#endif
