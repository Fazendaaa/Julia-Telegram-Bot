#=
This object represents a Telegram user or bot.

    Field       Type	   Description
    id	        Integer	   Unique identifier for this user or bot
    first_name	String	   User‘s or bot’s first name
    last_name	String	   Optional. User‘s or bot’s last name
    username	String	   Optional. User‘s or bot’s username
=#

type User
    __id::Int32
    __first_name::UTF8String
    __last_name::UTF8String
    __username::UTF8String
end

#=
This object represents a chat.

    Field	    Type      Description
    id	        Integer	  Unique identifier for this chat, not exceeding 1e13 by absolute value
    type	    String	  Type of chat, can be either “private”, “group”, “supergroup” or “channel”
    title	    String	  Optional. Title, for channels and group chats
    username	String	  Optional. Username, for private chats and channels if available
    first_name	String	  Optional. First name of the other party in a private chat
    last_name	String	  Optional. Last name of the other party in a private chat
=#

type Chat
    __id::Int32
    __type::UTF8String
    __title::UTF8String
    __username::UTF8String
    __first_name::UTF8String
    __last_name::UTF8String
end

#=
This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.

    Field	  Type	       Description
    type	  String	   Type of the entity. One of mention (@username), hashtag, bot_command, url, email, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs)
    offset	  Integer	   Offset in UTF-16 code units to the start of the entity
    length	  Integer	   Length of the entity in UTF-16 code units
    url	      String	   Optional. For “text_link” only, url that will be opened after user taps on the text
=#

type MessageEntity
    __type::UTF8String
    __offset::Int32
    __length::Int32
    __url::UTF8String
end

#=
This object represents an audio file to be treated as music by the Telegram clients.

    Field	      Type	    Description
    file_id	      String	Unique identifier for this file
    duration	  Integer	Duration of the audio in seconds as defined by sender
    performer	  String	Optional. Performer of the audio as defined by sender or by audio tags
    title	      String	Optional. Title of the audio as defined by sender or by audio tags
    mime_type	  String	Optional. MIME type of the file as defined by sender
    file_size	  Integer	Optional. File size
=#

type Audio
    __file_id::UTF8String
    __duration::Int32
    __performer::UTF8String
    __title::UTF8String
    __mime_type::UTF8String
    __file_size::Int32
end

#=
This object represents one size of a photo or a file / sticker thumbnail.

    Field	      Type	    Description
    file_id	      String	Unique identifier for this file
    width	      Integer	Photo width
    height	      Integer	Photo height
    file_size	  Integer	Optional. File size
=#

type PhotoSize
    __file_id::UTF8String
    __width::Int32
    __height::Int32
    __file_size::Int32
end

#=
This object represents a general file (as opposed to photos, voice messages and audio files).

    Field	      Type	       Description
    file_id	      String	   Unique file identifier
    thumb	      PhotoSize	   Optional. Document thumbnail as defined by sender
    file_name	  String	   Optional. Original filename as defined by sender
    mime_type	  String	   Optional. MIME type of the file as defined by sender
    file_size	  Integer	   Optional. File size
=#

type Document
    __file_id::UTF8String
    __thumb::PhotoSize
    __file_name::UTF8String
    __mime_type::UTF8String
    __file_size::Int32
end

#=
This object represents a sticker.

    Field	      Type	       Description
    file_id	      String	   Unique identifier for this file
    width	      Integer	   Sticker width
    height	      Integer	   Sticker height
    thumb	      PhotoSize	   Optional. Sticker thumbnail in .webp or .jpg format
    file_size	  Integer	   Optional. File size
=#

type Sticker
    __file_id::UTF8String
    __width::Int32
    __height::Int32
    __thumb::PhotoSize
    __file_size::Int32
end

#=
This object represents a video file.

    Field	      Type	       Description
    file_id	      String	   Unique identifier for this file
    width	      Integer	   Video width as defined by sender
    height	      Integer	   Video height as defined by sender
    duration	  Integer	   Duration of the video in seconds as defined by sender
    thumb	      PhotoSize	   Optional. Video thumbnail
    mime_type	  String	   Optional. Mime type of a file as defined by sender
    file_size	  Integer	   Optional. File size
=#

type Video
    __file_id::UTF8String
    __width::Int32
    __height::Int32
    __duration::Int32
    __thumb::PhotoSize
    __mime_type::UTF8String
    __file_size::Int32
end

#=
This object represents a voice note.

    Field	      Type	    Description
    file_id	      String	Unique identifier for this file
    duration	  Integer	Duration of the audio in seconds as defined by sender
    mime_type	  String	Optional. MIME type of the file as defined by sender
    file_size	  Integer	Optional. File size
=#

type Voice
    __file_id::UTF8String
    __duration::Int32
    __mime_type::UTF8String
    __file_size::Int32
end

#=
This object represents a phone contact.

    Field	          Type	       Description
    phone_number	  String       Contact's phone number
    first_name	      String	   Contact's first name
    last_name	      String	   Optional. Contact's last name
    user_id	          Integer	   Optional. Contact's user identifier in Telegram
=#

type Contact
    __phone_number::UTF8String
    __first_name::UTF8String
    __last_name::UTF8String
    __user_id::Int32
end

#=
This object represents a point on the map.

    Field	    Type	Description
    longitude	Float	Longitude as defined by sender
    latitude	Float	Latitude as defined by sender
=#

type Location
    __longitude::Float32
    __latitude::Float32
end

#=
This object represents a venue.

    Field	          Type	    Description
    location	      Location	Venue location
    title	          String	Name of the venue
    address	          String	Address of the venue
    foursquare_id	  String	Optional. Foursquare identifier of the venue
=#

type Venue
    __location::Location
    __title::UTF8String
    __address::UTF8String
    __foursquare_id::UTF8String
end

#=
This object represents a message.

    Field	                  Type	                   Description
    message_id	              Integer	               Unique message identifier
    from	                  User	                   Optional. Sender, can be empty for messages sent to channels
    date	                  Integer	               Date the message was sent in Unix time
    chat	                  Chat	                   Conversation the message belongs to
    forward_from	          User	                   Optional. For forwarded messages, sender of the original message
    forward_date	          Integer	               Optional. For forwarded messages, date the original message was sent in Unix time
    reply_to_message	      Message	               Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    text	                  String	               Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters.
    entities	              Array of MessageEntity   Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    audio	                  Audio	                   Optional. Message is an audio file, information about the file
    document	              Document	               Optional. Message is a general file, information about the file
    photo	                  Array of PhotoSize	   Optional. Message is a photo, available sizes of the photo
    sticker	                  Sticker	               Optional. Message is a sticker, information about the sticker
    video	                  Video	                   Optional. Message is a video, information about the video
    voice	                  Voice	                   Optional. Message is a voice message, information about the file
    caption	                  String	               Optional. Caption for the document, photo or video, 0-200 characters
    contact	                  Contact	               Optional. Message is a shared contact, information about the contact
    location	              Location	               Optional. Message is a shared location, information about the location
    venue	                  Venue	                   Optional. Message is a venue, information about the venue
    new_chat_member	          User	                   Optional. A new member was added to the group, information about them (this member may be the bot itself)
    left_chat_member	      User	                   Optional. A member was removed from the group, information about them (this member may be the bot itself)
    new_chat_title	          String	               Optional. A chat title was changed to this value
    new_chat_photo	          Array of PhotoSize	   Optional. A chat photo was change to this value
    delete_chat_photo	      True	                   Optional. Service message: the chat photo was deleted
    group_chat_created	      True	                   Optional. Service message: the group has been created
    supergroup_chat_created	  True	                   Optional. Service message: the supergroup has been created
    channel_chat_created	  True	                   Optional. Service message: the channel has been created
    migrate_to_chat_id	      Integer	               Optional. The group has been migrated to a supergroup with the specified identifier, not exceeding 1e13 by absolute value
    migrate_from_chat_id	  Integer	               Optional. The supergroup has been migrated from a group with the specified identifier, not exceeding 1e13 by absolute value
    pinned_message	          Message	               Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
=#

type Message
    __message_id::Int32
    __from::User
    __date::Int32
    __chat::Chat
    __forward_from::User
    __forward_date::Int32
    __replay_to_message::Message
    __text::UTF8String
    __entities::Array{ MessageEntity, 1 }
    __audio::Audio
    __document::Document
    __photo::Array{ PhotoSize, 1 }
    __sticker::Sticker
    __video::Video
    __voice::Voice
    __caption::UTF8String
    __contact::Contact
    __location::Location
    __venue::Venue
    __new_chat_member::User
    __left_chat_member::User
    __new_chat_title::UTF8String
    __new_chat_photo::Array{ PhotoSize, 1 }
    __delete_chat_photo::Bool=true
    __group_chat_created::Bool=true
    __channel_chat_created::Bool=true
    __migrate_to_chat_id::Int32
    __pinned_message::Message
end

#=
This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.

    Field	    Type	     Description
    id	        String	     Unique identifier for this query
    from	    User	     Sender
    location	Location	 Optional. Sender location, only for bots that request user location
    query	    String	     Text of the query
    offset	    String	     Offset of the results to be returned, can be controlled by the bot
=#

type InlineQuery
    __id::UTF8String
    __from::User
    __location::Location
    __query::UTF8String
    __offset::UTF8String
end

#=
Represents a result of an inline query that was chosen by the user and sent to their chat partner.

    Field	               Type	      Description
    result_id	           String	  The unique identifier for the result that was chosen
    from	               User	      The user that chose the result
    location	           Location	  Optional. Sender location, only for bots that require user location
    inline_message_id	   String	  Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
    query	               String	  The query that was used to obtain the result
=#

type ChosenInlineResult
    __result_id::UTF8String
    __from::User
    __location::Location
    __inline_message_id::UTF8String
    __query::UTF8String
end

#=
This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be presented. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be presented.

    Field	              Type	       Description
    id	                  String	   Unique identifier for this query
    from	              User	       Sender
    message	              Message	   Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
    inline_message_id	  String	   Optional. Identifier of the message sent via the bot in inline mode, that originated the query
    data	              String	   Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field
=#

type CallbackQuery
    __id::UTF8String
    __from::User
    __message::Message
    __inline_message_id::UTF8String
    __data::UTF8String
end

#=
This object represents an incoming update.
Only one of the optional parameters can be present in any given update.

    Field	              Type	               Description
    update_id	          Integer	           The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you’re using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order.
    message	              Message	           Optional. New incoming message of any kind — text, photo, sticker, etc.
    inline_query	      InlineQuery	       Optional. New incoming inline query
    chosen_inline_result  ChosenInlineResult   Optional. The result of an inline query that was chosen by a user and sent to their chat partner.
    callback_query	      CallbackQuery	       Optional. New incoming callback query
=#

type Update
    __update_id::Int32
    __message::Message
    __inline_query::InlineQuery
    __chosen_inline_result::ChosenInlineResult
    __callback_query::CallbackQuery
end

#=
This object represent a user's profile pictures.

    Field	        Type	                        Description
    total_count	    Integer	                        Total number of profile pictures the target user has
    photos	        Array of Array of PhotoSize	    Requested profile pictures (in up to 4 sizes each)
=#

type UserProfilePhotos
    __total_count::Int32
    __photos::Array{ Array{ PhotoSize, 1 }, 1 }
end

#=
This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.
Maximum file size to download is 20 MB

    Field	      Type	    Description
    file_id	      String	Unique identifier for this file
    file_size	  Integer	Optional. File size, if known
    file_path	  String	Optional. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
=#

type File
    __file_id::UTF8String
    __file_size::Int32
    __file_path::UTF8String
end

#=
This object represents one button of the reply keyboard. For simple text buttons String can be used instead of this object to specify text of the button. Optional fields are mutually exclusive.

    Field	              Type	    Description
    text	              String	Text of the button. If none of the optional fields are used, it will be sent to the bot as a message when the button is pressed
    request_contact	      Boolean	Optional. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only
    request_location	  Boolean	Optional. If True, the user's current location will be sent when the button is pressed. Available in private chats only
=#

type KeyboardButton
    __text::UTF8String
    __requested_contact::Bool
    __requested_location::Bool
end

#=
This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).

    Field	              Type	                               Description
    keyboard           	  Array of Array of KeyboardButton	   Array of button rows, each represented by an Array of KeyboardButton objects
    resize_keyboard	      Boolean	                           Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to false, in which case the custom keyboard is always of the same height as the app's standard keyboard.
    one_time_keyboard	  Boolean	                           Optional. Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again. Defaults to false.
    selective	          Boolean	                           Optional. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.

    Example: A user requests to change the bot‘s language, bot replies to the request with a keyboard to select the new language. Other users in the group don’t see the keyboard.
=#

type ReplyKeyboardMarkup
    __keyboard::Array{ Array{ KeyboardButton, 1 }, 1 }
    __resize_keyboard::Bool
    __one_time_keyboard::Bool
    __selective::Bool
end

#=
Upon receiving a message with this object, Telegram clients will hide the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup).

    Field	          Type	       Description
    hide_keyboard	  True	       Requests clients to hide the custom keyboard
    selective	      Boolean	   Optional. Use this parameter if you want to hide keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.

    Example: A user votes in a poll, bot returns confirmation message in reply to the vote and hides keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet.
=#

type ReplyKeyboardHide
    __hide_keyboard::Bool=true
    __selective::Bool
end

#=
This object represents one button of an inline keyboard. You must use exactly one of the optional fields.

    Field	              Type	    Description
    text	              String	Label text on the button
    url	                  String	Optional. HTTP url to be opened when button is pressed
    callback_data	      String	Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
    switch_inline_query	  String	Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.

Note: This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with switch_pm… actions – in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.
Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will display unsupported message.
=#

type InlineKeyboardButton
    __text::UTF8String
    __url::UTF8String
    __callback_data::UTF8String
    __switch_inline_query::UTF8String
end

#=
This object represents an inline keyboard that appears right next to the message it belongs to.
Warning: Inline keyboards are currently being tested and are only available in one-on-one chats (i.e., user-bot or user-user in the case of inline bots).

    Field	          Type	                                    Description
    inline_keyboard	  Array of Array of InlineKeyboardButton	Array of button rows, each represented by an Array of InlineKeyboardButton objects

Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will display unsupported message
=#

type InlineKeyboardMarkup
    __inline_keyboard::Array{ Array{ InlineKeyboardButton, 1 }, 1 }
end

#=
Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.

    Field	       Type	      Description
    force_reply	   True	      Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
    selective	   Boolean    Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.

Example: A poll bot for groups runs in privacy mode (only receives commands, replies to its messages and mentions). There could be two ways to create a new poll:
Explain the user how to send a command with parameters (e.g. /newpoll question answer1 answer2). May be appealing for hardcore users but lacks modern day polish.
Guide the user through a step-by-step process. ‘Please send me your question’, ‘Cool, now let’s add the first answer option‘, ’Great. Keep adding answer options, then send /done when you‘re ready’.
The last option is definitely more attractive. And if you use ForceReply in your bot‘s questions, it will receive the user’s answers even if it only receives replies, commands and mentions — without any extra work for the user.
=#

type ForceReply
    __force_reply::Bool=true
    __selective::Bool
end
