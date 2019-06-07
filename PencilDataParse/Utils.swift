//
//  Utils.swift
//  PencilDataParse
//
//  Created by Andrew Pouliot on 6/7/19.
//  Copyright © 2019 Darknoon. All rights reserved.
//

import Foundation
import PencilKit

func dumpData(_ data: Data, name: String = "data.drawing") -> URL {
  let docs = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
  return docs[0].appendingPathComponent(name)
}


extension PKDrawing {
  static var colorDrawing: PKDrawing {
    get {
      let data = NSDataAsset(name: "color")?.data
      return try! PKDrawing(data: data!)
    }
  }

}
