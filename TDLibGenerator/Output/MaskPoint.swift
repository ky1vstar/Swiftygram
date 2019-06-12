public extension TDEnum {

enum MaskPoint: TDEnumProtocol {

/// A mask should be placed relatively to the forehead
case forehead

/// A mask should be placed relatively to the eyes
case eyes

/// A mask should be placed relatively to the mouth
case mouth

/// A mask should be placed relatively to the chin
case chin

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "maskPointForehead":
self = .forehead

case "maskPointEyes":
self = .eyes

case "maskPointMouth":
self = .mouth

case "maskPointChin":
self = .chin

default:
throw DecodingError.typeMismatch(MaskPoint.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MaskPoint"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .chin:
case .mouth:
case .eyes:
case .forehead:
try container.encode("maskPointForehead", forKey: .init(string: "@type"))

try container.encode("maskPointEyes", forKey: .init(string: "@type"))

try container.encode("maskPointMouth", forKey: .init(string: "@type"))

try container.encode("maskPointChin", forKey: .init(string: "@type"))

}
}

}

}