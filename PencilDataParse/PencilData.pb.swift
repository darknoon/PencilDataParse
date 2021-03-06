// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: PencilDataParse/PencilData.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Example {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var field1: Int32 = 0

  var field2: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum E: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case `default` // = 0
    case UNRECOGNIZED(Int)

    init() {
      self = .default
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .default
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .default: return 0
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Example.E: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Example.E] = [
    .default,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Example: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Example"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "field1"),
    2: .same(proto: "field2"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.field1)
      case 2: try decoder.decodeRepeatedStringField(value: &self.field2)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.field1 != 0 {
      try visitor.visitSingularInt32Field(value: self.field1, fieldNumber: 1)
    }
    if !self.field2.isEmpty {
      try visitor.visitRepeatedStringField(value: self.field2, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Example, rhs: Example) -> Bool {
    if lhs.field1 != rhs.field1 {return false}
    if lhs.field2 != rhs.field2 {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Example.E: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DEFAULT"),
  ]
}
