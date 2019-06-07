//
//  PencilDataParseTests.swift
//  PencilDataParseTests
//
//  Created by Andrew Pouliot on 6/7/19.
//  Copyright © 2019 Darknoon. All rights reserved.
//

import XCTest
import PencilKit

@testable import PencilDataParse

class PencilDataParseTests: XCTestCase {

  func dumpURL(_ name: String) -> URL {
    let dir = "/Users/andrew/Developer/iPhone/PencilDataParse/TestData"
//    let dir =  NSTemporaryDirectory()
    return URL(fileURLWithPath: dir).appendingPathComponent(name)

  }

  // This doesn't work!
//    func testJSONEncode() {
//      func getDrawing () -> PKDrawing {
//        let data = NSDataAsset(name: "color")?.data
//        return try! PKDrawing(data: data!)
//      }
//
//      let e = JSONEncoder()
//      let d = getDrawing()
//      let dict = ["drawing": d]
//      do {
//        let jsonData = try e.encode(dict)
////        d.encode(to: e)
//
//        try jsonData.write(to: dumpURL("drawing.json"))
//
//      } catch {
//        print("error was \(error)")
//      }
//
//
//    }

  func testEmpty() throws {
    let d = PKDrawing()
    let path = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("empty.drawing")
    let data = d.dataRepresentation()
    try data.write(to: path)
    print("Wrote to path", path)
  }

  func testDoubleEmpty() throws {
    let d = PKDrawing().appending(PKDrawing())

    let path = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("double-empty.drawing")
    let data = d.dataRepresentation()
    try data.write(to: path)
    print("Wrote to path", path)
  }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
