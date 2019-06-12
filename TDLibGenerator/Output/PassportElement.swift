public extension TDEnum {

enum PassportElement: TDEnumProtocol {

/// A Telegram Passport element containing the user's personal details
/// 
/// - personalDetails: Personal details of the user
case personalDetails(personalDetails: TDObject.PersonalDetails)

/// A Telegram Passport element containing the user's passport
/// 
/// - passport: Passport
case passport(passport: TDObject.IdentityDocument)

/// A Telegram Passport element containing the user's driver license
/// 
/// - driverLicense: Driver license
case driverLicense(driverLicense: TDObject.IdentityDocument)

/// A Telegram Passport element containing the user's identity card
/// 
/// - identityCard: Identity card
case identityCard(identityCard: TDObject.IdentityDocument)

/// A Telegram Passport element containing the user's internal passport
/// 
/// - internalPassport: Internal passport
case internalPassport(internalPassport: TDObject.IdentityDocument)

/// A Telegram Passport element containing the user's address
/// 
/// - address: Address
case address(address: TDObject.Address)

/// A Telegram Passport element containing the user's utility bill
/// 
/// - utilityBill: Utility bill
case utilityBill(utilityBill: TDObject.PersonalDocument)

/// A Telegram Passport element containing the user's bank statement
/// 
/// - bankStatement: Bank statement
case bankStatement(bankStatement: TDObject.PersonalDocument)

/// A Telegram Passport element containing the user's rental agreement
/// 
/// - rentalAgreement: Rental agreement
case rentalAgreement(rentalAgreement: TDObject.PersonalDocument)

/// A Telegram Passport element containing the user's passport registration pages
/// 
/// - passportRegistration: Passport registration pages
case passportRegistration(passportRegistration: TDObject.PersonalDocument)

/// A Telegram Passport element containing the user's temporary registration
/// 
/// - temporaryRegistration: Temporary registration
case temporaryRegistration(temporaryRegistration: TDObject.PersonalDocument)

/// A Telegram Passport element containing the user's phone number
/// 
/// - phoneNumber: Phone number
case phoneNumber(phoneNumber: String)

/// A Telegram Passport element containing the user's email address
/// 
/// - emailAddress: Email address
case emailAddress(emailAddress: String)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "passportElementPersonalDetails":
let personalDetails = try container.decode(TDObject.PersonalDetails.self, forKey: .init(string: "personalDetails"))

self = .personalDetails(personalDetails: personalDetails)

case "passportElementPassport":
let passport = try container.decode(TDObject.IdentityDocument.self, forKey: .init(string: "passport"))

self = .passport(passport: passport)

case "passportElementDriverLicense":
let driverLicense = try container.decode(TDObject.IdentityDocument.self, forKey: .init(string: "driverLicense"))

self = .driverLicense(driverLicense: driverLicense)

case "passportElementIdentityCard":
let identityCard = try container.decode(TDObject.IdentityDocument.self, forKey: .init(string: "identityCard"))

self = .identityCard(identityCard: identityCard)

case "passportElementInternalPassport":
let internalPassport = try container.decode(TDObject.IdentityDocument.self, forKey: .init(string: "internalPassport"))

self = .internalPassport(internalPassport: internalPassport)

case "passportElementAddress":
let address = try container.decode(TDObject.Address.self, forKey: .init(string: "address"))

self = .address(address: address)

case "passportElementUtilityBill":
let utilityBill = try container.decode(TDObject.PersonalDocument.self, forKey: .init(string: "utilityBill"))

self = .utilityBill(utilityBill: utilityBill)

case "passportElementBankStatement":
let bankStatement = try container.decode(TDObject.PersonalDocument.self, forKey: .init(string: "bankStatement"))

self = .bankStatement(bankStatement: bankStatement)

case "passportElementRentalAgreement":
let rentalAgreement = try container.decode(TDObject.PersonalDocument.self, forKey: .init(string: "rentalAgreement"))

self = .rentalAgreement(rentalAgreement: rentalAgreement)

case "passportElementPassportRegistration":
let passportRegistration = try container.decode(TDObject.PersonalDocument.self, forKey: .init(string: "passportRegistration"))

self = .passportRegistration(passportRegistration: passportRegistration)

case "passportElementTemporaryRegistration":
let temporaryRegistration = try container.decode(TDObject.PersonalDocument.self, forKey: .init(string: "temporaryRegistration"))

self = .temporaryRegistration(temporaryRegistration: temporaryRegistration)

case "passportElementPhoneNumber":
let phoneNumber = try container.decode(String.self, forKey: .init(string: "phoneNumber"))

self = .phoneNumber(phoneNumber: phoneNumber)

case "passportElementEmailAddress":
let emailAddress = try container.decode(String.self, forKey: .init(string: "emailAddress"))

self = .emailAddress(emailAddress: emailAddress)

default:
throw DecodingError.typeMismatch(PassportElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PassportElement"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .emailAddress(let emailAddress):
case .phoneNumber(let phoneNumber):
case .temporaryRegistration(let temporaryRegistration):
case .passportRegistration(let passportRegistration):
case .rentalAgreement(let rentalAgreement):
case .bankStatement(let bankStatement):
case .utilityBill(let utilityBill):
case .address(let address):
case .internalPassport(let internalPassport):
case .identityCard(let identityCard):
case .driverLicense(let driverLicense):
case .passport(let passport):
case .personalDetails(let personalDetails):
try container.encode("passportElementPersonalDetails", forKey: .init(string: "@type"))

try container.encode(personalDetails, forKey: .init(string: "personalDetails"))

try container.encode("passportElementPassport", forKey: .init(string: "@type"))

try container.encode(passport, forKey: .init(string: "passport"))

try container.encode("passportElementDriverLicense", forKey: .init(string: "@type"))

try container.encode(driverLicense, forKey: .init(string: "driverLicense"))

try container.encode("passportElementIdentityCard", forKey: .init(string: "@type"))

try container.encode(identityCard, forKey: .init(string: "identityCard"))

try container.encode("passportElementInternalPassport", forKey: .init(string: "@type"))

try container.encode(internalPassport, forKey: .init(string: "internalPassport"))

try container.encode("passportElementAddress", forKey: .init(string: "@type"))

try container.encode(address, forKey: .init(string: "address"))

try container.encode("passportElementUtilityBill", forKey: .init(string: "@type"))

try container.encode(utilityBill, forKey: .init(string: "utilityBill"))

try container.encode("passportElementBankStatement", forKey: .init(string: "@type"))

try container.encode(bankStatement, forKey: .init(string: "bankStatement"))

try container.encode("passportElementRentalAgreement", forKey: .init(string: "@type"))

try container.encode(rentalAgreement, forKey: .init(string: "rentalAgreement"))

try container.encode("passportElementPassportRegistration", forKey: .init(string: "@type"))

try container.encode(passportRegistration, forKey: .init(string: "passportRegistration"))

try container.encode("passportElementTemporaryRegistration", forKey: .init(string: "@type"))

try container.encode(temporaryRegistration, forKey: .init(string: "temporaryRegistration"))

try container.encode("passportElementPhoneNumber", forKey: .init(string: "@type"))

try container.encode(phoneNumber, forKey: .init(string: "phoneNumber"))

try container.encode("passportElementEmailAddress", forKey: .init(string: "@type"))

try container.encode(emailAddress, forKey: .init(string: "emailAddress"))

}
}

}

}