public extension TDEnum {

enum InputMessageContent: TDEnumProtocol {

/// A text message
/// 
/// - text: Formatted text to be sent; 1-GetOption("message_text_length_max") characters. Only Bold, Italic, Code, Pre, PreCode and TextUrl entities are allowed to be specified manually
/// - disableWebPagePreview: True, if rich web page previews for URLs in the message text should be disabled
/// - clearDraft: True, if a chat message draft should be deleted
case text(text: TDObject.FormattedText, disableWebPagePreview: Bool, clearDraft: Bool)

/// An animation message (GIF-style).
/// 
/// - animation: Animation file to be sent
/// - thumbnail: Animation thumbnail, if available
/// - duration: Duration of the animation, in seconds
/// - width: Width of the animation; may be replaced by the server
/// - height: Height of the animation; may be replaced by the server
/// - caption: Animation caption; 0-GetOption("message_caption_length_max") characters
case animation(animation: TDEnum.InputFile, thumbnail: TDObject.InputThumbnail?, duration: Int, width: Int, height: Int, caption: TDObject.FormattedText)

/// An audio message
/// 
/// - audio: Audio file to be sent
/// - albumCoverThumbnail: Thumbnail of the cover for the album, if available
/// - duration: Duration of the audio, in seconds; may be replaced by the server
/// - title: Title of the audio; 0-64 characters; may be replaced by the server
/// - performer: Performer of the audio; 0-64 characters, may be replaced by the server
/// - caption: Audio caption; 0-GetOption("message_caption_length_max") characters
case audio(audio: TDEnum.InputFile, albumCoverThumbnail: TDObject.InputThumbnail?, duration: Int, title: String, performer: String, caption: TDObject.FormattedText)

/// A document message (general file)
/// 
/// - document: Document to be sent
/// - thumbnail: Document thumbnail, if available
/// - caption: Document caption; 0-GetOption("message_caption_length_max") characters
case document(document: TDEnum.InputFile, thumbnail: TDObject.InputThumbnail?, caption: TDObject.FormattedText)

/// A photo message
/// 
/// - photo: Photo to send
/// - thumbnail: Photo thumbnail to be sent, this is sent to the other party in secret chats only
/// - addedStickerFileIds: File identifiers of the stickers added to the photo, if applicable
/// - width: Photo width
/// - height: Photo height
/// - caption: Photo caption; 0-GetOption("message_caption_length_max") characters
/// - ttl: Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
case photo(photo: TDEnum.InputFile, thumbnail: TDObject.InputThumbnail, addedStickerFileIds: [Int]?, width: Int, height: Int, caption: TDObject.FormattedText, ttl: Int)

/// A sticker message
/// 
/// - sticker: Sticker to be sent
/// - thumbnail: Sticker thumbnail, if available
/// - width: Sticker width
/// - height: Sticker height
case sticker(sticker: TDEnum.InputFile, thumbnail: TDObject.InputThumbnail?, width: Int, height: Int)

/// A video message
/// 
/// - video: Video to be sent
/// - thumbnail: Video thumbnail, if available
/// - addedStickerFileIds: File identifiers of the stickers added to the video, if applicable
/// - duration: Duration of the video, in seconds
/// - width: Video width
/// - height: Video height
/// - supportsStreaming: True, if the video should be tried to be streamed
/// - caption: Video caption; 0-GetOption("message_caption_length_max") characters
/// - ttl: Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
case video(video: TDEnum.InputFile, thumbnail: TDObject.InputThumbnail?, addedStickerFileIds: [Int]?, duration: Int, width: Int, height: Int, supportsStreaming: Bool, caption: TDObject.FormattedText, ttl: Int)

/// A video note message
/// 
/// - videoNote: Video note to be sent
/// - thumbnail: Video thumbnail, if available
/// - duration: Duration of the video, in seconds
/// - length: Video width and height; must be positive and not greater than 640
case videoNote(videoNote: TDEnum.InputFile, thumbnail: TDObject.InputThumbnail?, duration: Int, length: Int)

/// A voice note message
/// 
/// - voiceNote: Voice note to be sent
/// - duration: Duration of the voice note, in seconds
/// - waveform: Waveform representation of the voice note, in 5-bit format
/// - caption: Voice note caption; 0-GetOption("message_caption_length_max") characters
case voiceNote(voiceNote: TDEnum.InputFile, duration: Int, waveform: String, caption: TDObject.FormattedText)

/// A message with a location
/// 
/// - location: Location to be sent
/// - livePeriod: Period for which the location can be updated, in seconds; should bebetween 60 and 86400 for a live location and 0 otherwise
case location(location: TDObject.Location, livePeriod: Int)

/// A message with information about a venue
/// 
/// - venue: Venue to send
case venue(venue: TDObject.Venue)

/// A message containing a user contact
/// 
/// - contact: Contact to send
case act(contact: TDObject.Contact)

/// A message with a game; not supported for channels or secret chats
/// 
/// - botUserId: User identifier of the bot that owns the game
/// - gameShortName: Short name of the game
case game(botUserId: Int, gameShortName: String)

/// A message with an invoice; can be used only by bots and only in private chats
/// 
/// - invoice: Invoice
/// - title: Product title; 1-32 characters
/// - description: Product description; 0-255 characters
/// - photoUrl: Product photo URL; optional
/// - photoSize: Product photo size
/// - photoWidth: Product photo width
/// - photoHeight: Product photo height
/// - payload: The invoice payload
/// - providerToken: Payment provider token
/// - providerData: JSON-encoded data about the invoice, which will be shared with the payment provider
/// - startParameter: Unique invoice bot start_parameter for the generation of this invoice
case invoice(invoice: TDObject.Invoice, title: String, description: String, photoUrl: String, photoSize: Int, photoWidth: Int, photoHeight: Int, payload: String, providerToken: String, providerData: String, startParameter: String)

/// A message with a poll. Polls can't be sent to private or secret chats
/// 
/// - question: Poll question, 1-255 characters
/// - options: List of poll answer options, 2-10 strings 1-100 characters each
case poll(question: String, options: [String])

/// A forwarded message
/// 
/// - fromChatId: Identifier for the chat this forwarded message came from
/// - messageId: Identifier of the message to forward
/// - inGameShare: True, if a game message should be shared within a launched game; applies only to game messages
case forwarded(fromChatId: Int64, messageId: Int64, inGameShare: Bool)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "inputMessageText":
let text = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "text"))
let disableWebPagePreview = try container.decode(Bool.self, forKey: .init(string: "disableWebPagePreview"))
let clearDraft = try container.decode(Bool.self, forKey: .init(string: "clearDraft"))

self = .text(text: text, disableWebPagePreview: disableWebPagePreview, clearDraft: clearDraft)

case "inputMessageAnimation":
let animation = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "animation"))
let thumbnail = try container.decodeIfPresent(TDObject.InputThumbnail.self, forKey: .init(string: "thumbnail"))
let duration = try container.decode(Int.self, forKey: .init(string: "duration"))
let width = try container.decode(Int.self, forKey: .init(string: "width"))
let height = try container.decode(Int.self, forKey: .init(string: "height"))
let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))

self = .animation(animation: animation, thumbnail: thumbnail, duration: duration, width: width, height: height, caption: caption)

case "inputMessageAudio":
let audio = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "audio"))
let albumCoverThumbnail = try container.decodeIfPresent(TDObject.InputThumbnail.self, forKey: .init(string: "albumCoverThumbnail"))
let duration = try container.decode(Int.self, forKey: .init(string: "duration"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let performer = try container.decode(String.self, forKey: .init(string: "performer"))
let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))

self = .audio(audio: audio, albumCoverThumbnail: albumCoverThumbnail, duration: duration, title: title, performer: performer, caption: caption)

case "inputMessageDocument":
let document = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "document"))
let thumbnail = try container.decodeIfPresent(TDObject.InputThumbnail.self, forKey: .init(string: "thumbnail"))
let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))

self = .document(document: document, thumbnail: thumbnail, caption: caption)

case "inputMessagePhoto":
let photo = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "photo"))
let thumbnail = try container.decode(TDObject.InputThumbnail.self, forKey: .init(string: "thumbnail"))
let addedStickerFileIds = try container.decodeIfPresent([Int].self, forKey: .init(string: "addedStickerFileIds"))
let width = try container.decode(Int.self, forKey: .init(string: "width"))
let height = try container.decode(Int.self, forKey: .init(string: "height"))
let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))
let ttl = try container.decode(Int.self, forKey: .init(string: "ttl"))

self = .photo(photo: photo, thumbnail: thumbnail, addedStickerFileIds: addedStickerFileIds, width: width, height: height, caption: caption, ttl: ttl)

case "inputMessageSticker":
let sticker = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "sticker"))
let thumbnail = try container.decodeIfPresent(TDObject.InputThumbnail.self, forKey: .init(string: "thumbnail"))
let width = try container.decode(Int.self, forKey: .init(string: "width"))
let height = try container.decode(Int.self, forKey: .init(string: "height"))

self = .sticker(sticker: sticker, thumbnail: thumbnail, width: width, height: height)

case "inputMessageVideo":
let video = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "video"))
let thumbnail = try container.decodeIfPresent(TDObject.InputThumbnail.self, forKey: .init(string: "thumbnail"))
let addedStickerFileIds = try container.decodeIfPresent([Int].self, forKey: .init(string: "addedStickerFileIds"))
let duration = try container.decode(Int.self, forKey: .init(string: "duration"))
let width = try container.decode(Int.self, forKey: .init(string: "width"))
let height = try container.decode(Int.self, forKey: .init(string: "height"))
let supportsStreaming = try container.decode(Bool.self, forKey: .init(string: "supportsStreaming"))
let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))
let ttl = try container.decode(Int.self, forKey: .init(string: "ttl"))

self = .video(video: video, thumbnail: thumbnail, addedStickerFileIds: addedStickerFileIds, duration: duration, width: width, height: height, supportsStreaming: supportsStreaming, caption: caption, ttl: ttl)

case "inputMessageVideoNote":
let videoNote = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "videoNote"))
let thumbnail = try container.decodeIfPresent(TDObject.InputThumbnail.self, forKey: .init(string: "thumbnail"))
let duration = try container.decode(Int.self, forKey: .init(string: "duration"))
let length = try container.decode(Int.self, forKey: .init(string: "length"))

self = .videoNote(videoNote: videoNote, thumbnail: thumbnail, duration: duration, length: length)

case "inputMessageVoiceNote":
let voiceNote = try container.decode(TDEnum.InputFile.self, forKey: .init(string: "voiceNote"))
let duration = try container.decode(Int.self, forKey: .init(string: "duration"))
let waveform = try container.decode(String.self, forKey: .init(string: "waveform"))
let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))

self = .voiceNote(voiceNote: voiceNote, duration: duration, waveform: waveform, caption: caption)

case "inputMessageLocation":
let location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
let livePeriod = try container.decode(Int.self, forKey: .init(string: "livePeriod"))

self = .location(location: location, livePeriod: livePeriod)

case "inputMessageVenue":
let venue = try container.decode(TDObject.Venue.self, forKey: .init(string: "venue"))

self = .venue(venue: venue)

case "inputMessageContact":
let contact = try container.decode(TDObject.Contact.self, forKey: .init(string: "contact"))

self = .act(contact: contact)

case "inputMessageGame":
let botUserId = try container.decode(Int.self, forKey: .init(string: "botUserId"))
let gameShortName = try container.decode(String.self, forKey: .init(string: "gameShortName"))

self = .game(botUserId: botUserId, gameShortName: gameShortName)

case "inputMessageInvoice":
let invoice = try container.decode(TDObject.Invoice.self, forKey: .init(string: "invoice"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let description = try container.decode(String.self, forKey: .init(string: "description"))
let photoUrl = try container.decode(String.self, forKey: .init(string: "photoUrl"))
let photoSize = try container.decode(Int.self, forKey: .init(string: "photoSize"))
let photoWidth = try container.decode(Int.self, forKey: .init(string: "photoWidth"))
let photoHeight = try container.decode(Int.self, forKey: .init(string: "photoHeight"))
let payload = try container.decode(String.self, forKey: .init(string: "payload"))
let providerToken = try container.decode(String.self, forKey: .init(string: "providerToken"))
let providerData = try container.decode(String.self, forKey: .init(string: "providerData"))
let startParameter = try container.decode(String.self, forKey: .init(string: "startParameter"))

self = .invoice(invoice: invoice, title: title, description: description, photoUrl: photoUrl, photoSize: photoSize, photoWidth: photoWidth, photoHeight: photoHeight, payload: payload, providerToken: providerToken, providerData: providerData, startParameter: startParameter)

case "inputMessagePoll":
let question = try container.decode(String.self, forKey: .init(string: "question"))
let options = try container.decode([String].self, forKey: .init(string: "options"))

self = .poll(question: question, options: options)

case "inputMessageForwarded":
let fromChatId = try container.decode(Int64.self, forKey: .init(string: "fromChatId"))
let messageId = try container.decode(Int64.self, forKey: .init(string: "messageId"))
let inGameShare = try container.decode(Bool.self, forKey: .init(string: "inGameShare"))

self = .forwarded(fromChatId: fromChatId, messageId: messageId, inGameShare: inGameShare)

default:
throw DecodingError.typeMismatch(InputMessageContent.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InputMessageContent"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .forwarded(let fromChatId, let messageId, let inGameShare):
case .poll(let question, let options):
case .invoice(let invoice, let title, let description, let photoUrl, let photoSize, let photoWidth, let photoHeight, let payload, let providerToken, let providerData, let startParameter):
case .game(let botUserId, let gameShortName):
case .act(let contact):
case .venue(let venue):
case .location(let location, let livePeriod):
case .voiceNote(let voiceNote, let duration, let waveform, let caption):
case .videoNote(let videoNote, let thumbnail, let duration, let length):
case .video(let video, let thumbnail, let addedStickerFileIds, let duration, let width, let height, let supportsStreaming, let caption, let ttl):
case .sticker(let sticker, let thumbnail, let width, let height):
case .photo(let photo, let thumbnail, let addedStickerFileIds, let width, let height, let caption, let ttl):
case .document(let document, let thumbnail, let caption):
case .audio(let audio, let albumCoverThumbnail, let duration, let title, let performer, let caption):
case .animation(let animation, let thumbnail, let duration, let width, let height, let caption):
case .text(let text, let disableWebPagePreview, let clearDraft):
try container.encode("inputMessageText", forKey: .init(string: "@type"))

try container.encode(text, forKey: .init(string: "text"))
try container.encode(disableWebPagePreview, forKey: .init(string: "disableWebPagePreview"))
try container.encode(clearDraft, forKey: .init(string: "clearDraft"))

try container.encode("inputMessageAnimation", forKey: .init(string: "@type"))

try container.encode(animation, forKey: .init(string: "animation"))
try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))
try container.encode(duration, forKey: .init(string: "duration"))
try container.encode(width, forKey: .init(string: "width"))
try container.encode(height, forKey: .init(string: "height"))
try container.encode(caption, forKey: .init(string: "caption"))

try container.encode("inputMessageAudio", forKey: .init(string: "@type"))

try container.encode(audio, forKey: .init(string: "audio"))
try container.encodeIfPresent(albumCoverThumbnail, forKey: .init(string: "albumCoverThumbnail"))
try container.encode(duration, forKey: .init(string: "duration"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(performer, forKey: .init(string: "performer"))
try container.encode(caption, forKey: .init(string: "caption"))

try container.encode("inputMessageDocument", forKey: .init(string: "@type"))

try container.encode(document, forKey: .init(string: "document"))
try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))
try container.encode(caption, forKey: .init(string: "caption"))

try container.encode("inputMessagePhoto", forKey: .init(string: "@type"))

try container.encode(photo, forKey: .init(string: "photo"))
try container.encode(thumbnail, forKey: .init(string: "thumbnail"))
try container.encodeIfPresent(addedStickerFileIds, forKey: .init(string: "addedStickerFileIds"))
try container.encode(width, forKey: .init(string: "width"))
try container.encode(height, forKey: .init(string: "height"))
try container.encode(caption, forKey: .init(string: "caption"))
try container.encode(ttl, forKey: .init(string: "ttl"))

try container.encode("inputMessageSticker", forKey: .init(string: "@type"))

try container.encode(sticker, forKey: .init(string: "sticker"))
try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))
try container.encode(width, forKey: .init(string: "width"))
try container.encode(height, forKey: .init(string: "height"))

try container.encode("inputMessageVideo", forKey: .init(string: "@type"))

try container.encode(video, forKey: .init(string: "video"))
try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))
try container.encodeIfPresent(addedStickerFileIds, forKey: .init(string: "addedStickerFileIds"))
try container.encode(duration, forKey: .init(string: "duration"))
try container.encode(width, forKey: .init(string: "width"))
try container.encode(height, forKey: .init(string: "height"))
try container.encode(supportsStreaming, forKey: .init(string: "supportsStreaming"))
try container.encode(caption, forKey: .init(string: "caption"))
try container.encode(ttl, forKey: .init(string: "ttl"))

try container.encode("inputMessageVideoNote", forKey: .init(string: "@type"))

try container.encode(videoNote, forKey: .init(string: "videoNote"))
try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))
try container.encode(duration, forKey: .init(string: "duration"))
try container.encode(length, forKey: .init(string: "length"))

try container.encode("inputMessageVoiceNote", forKey: .init(string: "@type"))

try container.encode(voiceNote, forKey: .init(string: "voiceNote"))
try container.encode(duration, forKey: .init(string: "duration"))
try container.encode(waveform, forKey: .init(string: "waveform"))
try container.encode(caption, forKey: .init(string: "caption"))

try container.encode("inputMessageLocation", forKey: .init(string: "@type"))

try container.encode(location, forKey: .init(string: "location"))
try container.encode(livePeriod, forKey: .init(string: "livePeriod"))

try container.encode("inputMessageVenue", forKey: .init(string: "@type"))

try container.encode(venue, forKey: .init(string: "venue"))

try container.encode("inputMessageContact", forKey: .init(string: "@type"))

try container.encode(contact, forKey: .init(string: "contact"))

try container.encode("inputMessageGame", forKey: .init(string: "@type"))

try container.encode(botUserId, forKey: .init(string: "botUserId"))
try container.encode(gameShortName, forKey: .init(string: "gameShortName"))

try container.encode("inputMessageInvoice", forKey: .init(string: "@type"))

try container.encode(invoice, forKey: .init(string: "invoice"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(description, forKey: .init(string: "description"))
try container.encode(photoUrl, forKey: .init(string: "photoUrl"))
try container.encode(photoSize, forKey: .init(string: "photoSize"))
try container.encode(photoWidth, forKey: .init(string: "photoWidth"))
try container.encode(photoHeight, forKey: .init(string: "photoHeight"))
try container.encode(payload, forKey: .init(string: "payload"))
try container.encode(providerToken, forKey: .init(string: "providerToken"))
try container.encode(providerData, forKey: .init(string: "providerData"))
try container.encode(startParameter, forKey: .init(string: "startParameter"))

try container.encode("inputMessagePoll", forKey: .init(string: "@type"))

try container.encode(question, forKey: .init(string: "question"))
try container.encode(options, forKey: .init(string: "options"))

try container.encode("inputMessageForwarded", forKey: .init(string: "@type"))

try container.encode(fromChatId, forKey: .init(string: "fromChatId"))
try container.encode(messageId, forKey: .init(string: "messageId"))
try container.encode(inGameShare, forKey: .init(string: "inGameShare"))

}
}

}

}