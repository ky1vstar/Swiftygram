//
//  LogStream.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes a stream to which TDLib internal log is written
     */
    enum LogStream: TDEnumProtocol {
        /**
         The log is written to stderr or an OS specific log
         */
        case `default`

        /**
         The log is written to a file

         - path: Path to the file to where the internal TDLib log will be written
         - maxFileSize: Maximum size of the file to where the internal TDLib log is written before the file will be auto-rotated
         */
        case file(path: String, maxFileSize: Int64)

        /**
         The log is written nowhere
         */
        case empty

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "logStreamDefault":
                self = .default

            case "logStreamFile":
                let path = try container.decode(String.self, forKey: .init(string: "path"))
                let maxFileSize = try container.decodeInt64(forKey: .init(string: "maxFileSize"))

                self = .file(path: path, maxFileSize: maxFileSize)

            case "logStreamEmpty":
                self = .empty

            default:
                throw DecodingError.typeMismatch(LogStream.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined LogStream"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .default:
                try container.encode("logStreamDefault", forKey: .type)

            case let .file(path, maxFileSize):
                try container.encode("logStreamFile", forKey: .type)

                try container.encode(path, forKey: .init(string: "path"))
                try container.encodeInt64(maxFileSize, forKey: .init(string: "maxFileSize"))

            case .empty:
                try container.encode("logStreamEmpty", forKey: .type)
            }
        }
    }
}
