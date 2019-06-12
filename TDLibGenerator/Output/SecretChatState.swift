public extension TDEnum {

enum SecretChatState: TDEnumProtocol {

/// The secret chat is not yet created; waiting for the other user to get online
case pending

/// The secret chat is ready to use
case ready

/// The secret chat is closed
case closed

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "secretChatStatePending":
self = .pending

case "secretChatStateReady":
self = .ready

case "secretChatStateClosed":
self = .closed

default:
throw DecodingError.typeMismatch(SecretChatState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined SecretChatState"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .closed:
case .ready:
case .pending:
try container.encode("secretChatStatePending", forKey: .init(string: "@type"))

try container.encode("secretChatStateReady", forKey: .init(string: "@type"))

try container.encode("secretChatStateClosed", forKey: .init(string: "@type"))

}
}

}

}