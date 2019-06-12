public extension TDEnum {

enum InputInlineQueryResult: TDEnumProtocol {

/// Represents a link to an animated GIF
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the query result
/// - thumbnailUrl: URL of the static result thumbnail (JPEG or GIF), if it exists
/// - gifUrl: The URL of the GIF-file (file size must not exceed 1MB)
/// - gifDuration: Duration of the GIF, in seconds
/// - gifWidth: Width of the GIF
/// - gifHeight: Height of the GIF
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageAnimation, InputMessageLocation, InputMessageVenue or InputMessageContact
case animatedGif(id: String, title: String, thumbnailUrl: String, gifUrl: String, gifDuration: Int, gifWidth: Int, gifHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to an animated (i.e. without sound) H.264/MPEG-4 AVC video
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the result
/// - thumbnailUrl: URL of the static result thumbnail (JPEG or GIF), if it exists
/// - mpeg4Url: The URL of the MPEG4-file (file size must not exceed 1MB)
/// - mpeg4Duration: Duration of the video, in seconds
/// - mpeg4Width: Width of the video
/// - mpeg4Height: Height of the video
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageAnimation, InputMessageLocation, InputMessageVenue or InputMessageContact
case animatedMpeg4(id: String, title: String, thumbnailUrl: String, mpeg4Url: String, mpeg4Duration: Int, mpeg4Width: Int, mpeg4Height: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to an article or web page
/// 
/// - id: Unique identifier of the query result
/// - url: URL of the result, if it exists
/// - hideUrl: True, if the URL must be not shown
/// - title: Title of the result
/// - description: A short description of the result
/// - thumbnailUrl: URL of the result thumbnail, if it exists
/// - thumbnailWidth: Thumbnail width, if known
/// - thumbnailHeight: Thumbnail height, if known
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
case article(id: String, url: String, hideUrl: Bool, title: String, description: String, thumbnailUrl: String, thumbnailWidth: Int, thumbnailHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to an MP3 audio file
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the audio file
/// - performer: Performer of the audio file
/// - audioUrl: The URL of the audio file
/// - audioDuration: Audio file duration, in seconds
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageAudio, InputMessageLocation, InputMessageVenue or InputMessageContact
case audio(id: String, title: String, performer: String, audioUrl: String, audioDuration: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a user contact
/// 
/// - id: Unique identifier of the query result
/// - contact: User contact
/// - thumbnailUrl: URL of the result thumbnail, if it exists
/// - thumbnailWidth: Thumbnail width, if known
/// - thumbnailHeight: Thumbnail height, if known
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
case contact(id: String, contact: TDObject.Contact, thumbnailUrl: String, thumbnailWidth: Int, thumbnailHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to a file
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the resulting file
/// - description: Short description of the result, if known
/// - documentUrl: URL of the file
/// - mimeType: MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed
/// - thumbnailUrl: The URL of the file thumbnail, if it exists
/// - thumbnailWidth: Width of the thumbnail
/// - thumbnailHeight: Height of the thumbnail
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageDocument, InputMessageLocation, InputMessageVenue or InputMessageContact
case document(id: String, title: String, description: String, documentUrl: String, mimeType: String, thumbnailUrl: String, thumbnailWidth: Int, thumbnailHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a game
/// 
/// - id: Unique identifier of the query result
/// - gameShortName: Short name of the game
/// - replyMarkup: Message reply markup. Must be of type replyMarkupInlineKeyboard or null
case game(id: String, gameShortName: String, replyMarkup: TDEnum.ReplyMarkup)

/// Represents a point on the map
/// 
/// - id: Unique identifier of the query result
/// - location: Location result
/// - livePeriod: Amount of time relative to the message sent time until the location can be updated, in seconds
/// - title: Title of the result
/// - thumbnailUrl: URL of the result thumbnail, if it exists
/// - thumbnailWidth: Thumbnail width, if known
/// - thumbnailHeight: Thumbnail height, if known
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
case location(id: String, location: TDObject.Location, livePeriod: Int, title: String, thumbnailUrl: String, thumbnailWidth: Int, thumbnailHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents link to a JPEG image
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the result, if known
/// - description: A short description of the result, if known
/// - thumbnailUrl: URL of the photo thumbnail, if it exists
/// - photoUrl: The URL of the JPEG photo (photo size must not exceed 5MB)
/// - photoWidth: Width of the photo
/// - photoHeight: Height of the photo
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessagePhoto, InputMessageLocation, InputMessageVenue or InputMessageContact
case photo(id: String, title: String, description: String, thumbnailUrl: String, photoUrl: String, photoWidth: Int, photoHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to a WEBP sticker
/// 
/// - id: Unique identifier of the query result
/// - thumbnailUrl: URL of the sticker thumbnail, if it exists
/// - stickerUrl: The URL of the WEBP sticker (sticker file size must not exceed 5MB)
/// - stickerWidth: Width of the sticker
/// - stickerHeight: Height of the sticker
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, inputMessageSticker, InputMessageLocation, InputMessageVenue or InputMessageContact
case sticker(id: String, thumbnailUrl: String, stickerUrl: String, stickerWidth: Int, stickerHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents information about a venue
/// 
/// - id: Unique identifier of the query result
/// - venue: Venue result
/// - thumbnailUrl: URL of the result thumbnail, if it exists
/// - thumbnailWidth: Thumbnail width, if known
/// - thumbnailHeight: Thumbnail height, if known
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageLocation, InputMessageVenue or InputMessageContact
case venue(id: String, venue: TDObject.Venue, thumbnailUrl: String, thumbnailWidth: Int, thumbnailHeight: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to a page containing an embedded video player or a video file
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the result
/// - description: A short description of the result, if known
/// - thumbnailUrl: The URL of the video thumbnail (JPEG), if it exists
/// - videoUrl: URL of the embedded video player or video file
/// - mimeType: MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported
/// - videoWidth: Width of the video
/// - videoHeight: Height of the video
/// - videoDuration: Video duration, in seconds
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageVideo, InputMessageLocation, InputMessageVenue or InputMessageContact
case video(id: String, title: String, description: String, thumbnailUrl: String, videoUrl: String, mimeType: String, videoWidth: Int, videoHeight: Int, videoDuration: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

/// Represents a link to an opus-encoded audio file within an OGG container, single channel audio
/// 
/// - id: Unique identifier of the query result
/// - title: Title of the voice note
/// - voiceNoteUrl: The URL of the voice note file
/// - voiceNoteDuration: Duration of the voice note, in seconds
/// - replyMarkup: The message reply markup. Must be of type replyMarkupInlineKeyboard or null
/// - inputMessageContent: The content of the message to be sent. Must be one of the following types: InputMessageText, InputMessageVoiceNote, InputMessageLocation, InputMessageVenue or InputMessageContact
case voiceNote(id: String, title: String, voiceNoteUrl: String, voiceNoteDuration: Int, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "inputInlineQueryResultAnimatedGif":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let gifUrl = try container.decode(String.self, forKey: .init(string: "gifUrl"))
let gifDuration = try container.decode(Int.self, forKey: .init(string: "gifDuration"))
let gifWidth = try container.decode(Int.self, forKey: .init(string: "gifWidth"))
let gifHeight = try container.decode(Int.self, forKey: .init(string: "gifHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .animatedGif(id: id, title: title, thumbnailUrl: thumbnailUrl, gifUrl: gifUrl, gifDuration: gifDuration, gifWidth: gifWidth, gifHeight: gifHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultAnimatedMpeg4":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let mpeg4Url = try container.decode(String.self, forKey: .init(string: "mpeg4Url"))
let mpeg4Duration = try container.decode(Int.self, forKey: .init(string: "mpeg4Duration"))
let mpeg4Width = try container.decode(Int.self, forKey: .init(string: "mpeg4Width"))
let mpeg4Height = try container.decode(Int.self, forKey: .init(string: "mpeg4Height"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .animatedMpeg4(id: id, title: title, thumbnailUrl: thumbnailUrl, mpeg4Url: mpeg4Url, mpeg4Duration: mpeg4Duration, mpeg4Width: mpeg4Width, mpeg4Height: mpeg4Height, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultArticle":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let url = try container.decode(String.self, forKey: .init(string: "url"))
let hideUrl = try container.decode(Bool.self, forKey: .init(string: "hideUrl"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let description = try container.decode(String.self, forKey: .init(string: "description"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let thumbnailWidth = try container.decode(Int.self, forKey: .init(string: "thumbnailWidth"))
let thumbnailHeight = try container.decode(Int.self, forKey: .init(string: "thumbnailHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .article(id: id, url: url, hideUrl: hideUrl, title: title, description: description, thumbnailUrl: thumbnailUrl, thumbnailWidth: thumbnailWidth, thumbnailHeight: thumbnailHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultAudio":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let performer = try container.decode(String.self, forKey: .init(string: "performer"))
let audioUrl = try container.decode(String.self, forKey: .init(string: "audioUrl"))
let audioDuration = try container.decode(Int.self, forKey: .init(string: "audioDuration"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .audio(id: id, title: title, performer: performer, audioUrl: audioUrl, audioDuration: audioDuration, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultContact":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let contact = try container.decode(TDObject.Contact.self, forKey: .init(string: "contact"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let thumbnailWidth = try container.decode(Int.self, forKey: .init(string: "thumbnailWidth"))
let thumbnailHeight = try container.decode(Int.self, forKey: .init(string: "thumbnailHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .contact(id: id, contact: contact, thumbnailUrl: thumbnailUrl, thumbnailWidth: thumbnailWidth, thumbnailHeight: thumbnailHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultDocument":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let description = try container.decode(String.self, forKey: .init(string: "description"))
let documentUrl = try container.decode(String.self, forKey: .init(string: "documentUrl"))
let mimeType = try container.decode(String.self, forKey: .init(string: "mimeType"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let thumbnailWidth = try container.decode(Int.self, forKey: .init(string: "thumbnailWidth"))
let thumbnailHeight = try container.decode(Int.self, forKey: .init(string: "thumbnailHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .document(id: id, title: title, description: description, documentUrl: documentUrl, mimeType: mimeType, thumbnailUrl: thumbnailUrl, thumbnailWidth: thumbnailWidth, thumbnailHeight: thumbnailHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultGame":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let gameShortName = try container.decode(String.self, forKey: .init(string: "gameShortName"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))

self = .game(id: id, gameShortName: gameShortName, replyMarkup: replyMarkup)

case "inputInlineQueryResultLocation":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
let livePeriod = try container.decode(Int.self, forKey: .init(string: "livePeriod"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let thumbnailWidth = try container.decode(Int.self, forKey: .init(string: "thumbnailWidth"))
let thumbnailHeight = try container.decode(Int.self, forKey: .init(string: "thumbnailHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .location(id: id, location: location, livePeriod: livePeriod, title: title, thumbnailUrl: thumbnailUrl, thumbnailWidth: thumbnailWidth, thumbnailHeight: thumbnailHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultPhoto":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let description = try container.decode(String.self, forKey: .init(string: "description"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let photoUrl = try container.decode(String.self, forKey: .init(string: "photoUrl"))
let photoWidth = try container.decode(Int.self, forKey: .init(string: "photoWidth"))
let photoHeight = try container.decode(Int.self, forKey: .init(string: "photoHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .photo(id: id, title: title, description: description, thumbnailUrl: thumbnailUrl, photoUrl: photoUrl, photoWidth: photoWidth, photoHeight: photoHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultSticker":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let stickerUrl = try container.decode(String.self, forKey: .init(string: "stickerUrl"))
let stickerWidth = try container.decode(Int.self, forKey: .init(string: "stickerWidth"))
let stickerHeight = try container.decode(Int.self, forKey: .init(string: "stickerHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .sticker(id: id, thumbnailUrl: thumbnailUrl, stickerUrl: stickerUrl, stickerWidth: stickerWidth, stickerHeight: stickerHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultVenue":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let venue = try container.decode(TDObject.Venue.self, forKey: .init(string: "venue"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let thumbnailWidth = try container.decode(Int.self, forKey: .init(string: "thumbnailWidth"))
let thumbnailHeight = try container.decode(Int.self, forKey: .init(string: "thumbnailHeight"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .venue(id: id, venue: venue, thumbnailUrl: thumbnailUrl, thumbnailWidth: thumbnailWidth, thumbnailHeight: thumbnailHeight, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultVideo":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let description = try container.decode(String.self, forKey: .init(string: "description"))
let thumbnailUrl = try container.decode(String.self, forKey: .init(string: "thumbnailUrl"))
let videoUrl = try container.decode(String.self, forKey: .init(string: "videoUrl"))
let mimeType = try container.decode(String.self, forKey: .init(string: "mimeType"))
let videoWidth = try container.decode(Int.self, forKey: .init(string: "videoWidth"))
let videoHeight = try container.decode(Int.self, forKey: .init(string: "videoHeight"))
let videoDuration = try container.decode(Int.self, forKey: .init(string: "videoDuration"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .video(id: id, title: title, description: description, thumbnailUrl: thumbnailUrl, videoUrl: videoUrl, mimeType: mimeType, videoWidth: videoWidth, videoHeight: videoHeight, videoDuration: videoDuration, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

case "inputInlineQueryResultVoiceNote":
let id = try container.decode(String.self, forKey: .init(string: "id"))
let title = try container.decode(String.self, forKey: .init(string: "title"))
let voiceNoteUrl = try container.decode(String.self, forKey: .init(string: "voiceNoteUrl"))
let voiceNoteDuration = try container.decode(Int.self, forKey: .init(string: "voiceNoteDuration"))
let replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
let inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))

self = .voiceNote(id: id, title: title, voiceNoteUrl: voiceNoteUrl, voiceNoteDuration: voiceNoteDuration, replyMarkup: replyMarkup, inputMessageContent: inputMessageContent)

default:
throw DecodingError.typeMismatch(InputInlineQueryResult.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InputInlineQueryResult"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .voiceNote(let id, let title, let voiceNoteUrl, let voiceNoteDuration, let replyMarkup, let inputMessageContent):
case .video(let id, let title, let description, let thumbnailUrl, let videoUrl, let mimeType, let videoWidth, let videoHeight, let videoDuration, let replyMarkup, let inputMessageContent):
case .venue(let id, let venue, let thumbnailUrl, let thumbnailWidth, let thumbnailHeight, let replyMarkup, let inputMessageContent):
case .sticker(let id, let thumbnailUrl, let stickerUrl, let stickerWidth, let stickerHeight, let replyMarkup, let inputMessageContent):
case .photo(let id, let title, let description, let thumbnailUrl, let photoUrl, let photoWidth, let photoHeight, let replyMarkup, let inputMessageContent):
case .location(let id, let location, let livePeriod, let title, let thumbnailUrl, let thumbnailWidth, let thumbnailHeight, let replyMarkup, let inputMessageContent):
case .game(let id, let gameShortName, let replyMarkup):
case .document(let id, let title, let description, let documentUrl, let mimeType, let thumbnailUrl, let thumbnailWidth, let thumbnailHeight, let replyMarkup, let inputMessageContent):
case .contact(let id, let contact, let thumbnailUrl, let thumbnailWidth, let thumbnailHeight, let replyMarkup, let inputMessageContent):
case .audio(let id, let title, let performer, let audioUrl, let audioDuration, let replyMarkup, let inputMessageContent):
case .article(let id, let url, let hideUrl, let title, let description, let thumbnailUrl, let thumbnailWidth, let thumbnailHeight, let replyMarkup, let inputMessageContent):
case .animatedMpeg4(let id, let title, let thumbnailUrl, let mpeg4Url, let mpeg4Duration, let mpeg4Width, let mpeg4Height, let replyMarkup, let inputMessageContent):
case .animatedGif(let id, let title, let thumbnailUrl, let gifUrl, let gifDuration, let gifWidth, let gifHeight, let replyMarkup, let inputMessageContent):
try container.encode("inputInlineQueryResultAnimatedGif", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(gifUrl, forKey: .init(string: "gifUrl"))
try container.encode(gifDuration, forKey: .init(string: "gifDuration"))
try container.encode(gifWidth, forKey: .init(string: "gifWidth"))
try container.encode(gifHeight, forKey: .init(string: "gifHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultAnimatedMpeg4", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(mpeg4Url, forKey: .init(string: "mpeg4Url"))
try container.encode(mpeg4Duration, forKey: .init(string: "mpeg4Duration"))
try container.encode(mpeg4Width, forKey: .init(string: "mpeg4Width"))
try container.encode(mpeg4Height, forKey: .init(string: "mpeg4Height"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultArticle", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(url, forKey: .init(string: "url"))
try container.encode(hideUrl, forKey: .init(string: "hideUrl"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(description, forKey: .init(string: "description"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(thumbnailWidth, forKey: .init(string: "thumbnailWidth"))
try container.encode(thumbnailHeight, forKey: .init(string: "thumbnailHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultAudio", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(performer, forKey: .init(string: "performer"))
try container.encode(audioUrl, forKey: .init(string: "audioUrl"))
try container.encode(audioDuration, forKey: .init(string: "audioDuration"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultContact", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(contact, forKey: .init(string: "contact"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(thumbnailWidth, forKey: .init(string: "thumbnailWidth"))
try container.encode(thumbnailHeight, forKey: .init(string: "thumbnailHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultDocument", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(description, forKey: .init(string: "description"))
try container.encode(documentUrl, forKey: .init(string: "documentUrl"))
try container.encode(mimeType, forKey: .init(string: "mimeType"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(thumbnailWidth, forKey: .init(string: "thumbnailWidth"))
try container.encode(thumbnailHeight, forKey: .init(string: "thumbnailHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultGame", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(gameShortName, forKey: .init(string: "gameShortName"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))

try container.encode("inputInlineQueryResultLocation", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(location, forKey: .init(string: "location"))
try container.encode(livePeriod, forKey: .init(string: "livePeriod"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(thumbnailWidth, forKey: .init(string: "thumbnailWidth"))
try container.encode(thumbnailHeight, forKey: .init(string: "thumbnailHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultPhoto", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(description, forKey: .init(string: "description"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(photoUrl, forKey: .init(string: "photoUrl"))
try container.encode(photoWidth, forKey: .init(string: "photoWidth"))
try container.encode(photoHeight, forKey: .init(string: "photoHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultSticker", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(stickerUrl, forKey: .init(string: "stickerUrl"))
try container.encode(stickerWidth, forKey: .init(string: "stickerWidth"))
try container.encode(stickerHeight, forKey: .init(string: "stickerHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultVenue", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(venue, forKey: .init(string: "venue"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(thumbnailWidth, forKey: .init(string: "thumbnailWidth"))
try container.encode(thumbnailHeight, forKey: .init(string: "thumbnailHeight"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultVideo", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(description, forKey: .init(string: "description"))
try container.encode(thumbnailUrl, forKey: .init(string: "thumbnailUrl"))
try container.encode(videoUrl, forKey: .init(string: "videoUrl"))
try container.encode(mimeType, forKey: .init(string: "mimeType"))
try container.encode(videoWidth, forKey: .init(string: "videoWidth"))
try container.encode(videoHeight, forKey: .init(string: "videoHeight"))
try container.encode(videoDuration, forKey: .init(string: "videoDuration"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

try container.encode("inputInlineQueryResultVoiceNote", forKey: .init(string: "@type"))

try container.encode(id, forKey: .init(string: "id"))
try container.encode(title, forKey: .init(string: "title"))
try container.encode(voiceNoteUrl, forKey: .init(string: "voiceNoteUrl"))
try container.encode(voiceNoteDuration, forKey: .init(string: "voiceNoteDuration"))
try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))

}
}

}

}