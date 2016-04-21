#=
Use this method to receive incoming updates using long polling (wiki). An Array of Update objects is returned.

    Parameters	     Type	    Required	Description
    offset	         Integer	Optional	Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will forgotten.
    limit	         Integer	Optional	Limits the number of updates to be retrieved. Values between 1—100 are accepted. Defaults to 100.
    timeout	         Integer	Optional	Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling

Notes
1. This method will not work if an outgoing webhook is set up.
2. In order to avoid getting duplicate updates, recalculate offset after each server response.
=#
function getUpdates( offset::Int32, limit::Int32, timeout::Int32 )
end

#=
Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts.
If you'd like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. https://www.example.com/<token>. Since nobody else knows your bot‘s token, you can be pretty sure it’s us.

    Parameters	 Type	    Required	Description
    url	         String	    Optional	HTTPS url to send updates to. Use an empty string to remove webhook integration
    certificate	 InputFile	Optional	Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.

Notes
1. You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
2. To use a self-signed certificate, you need to upload your public key certificate using certificate parameter. Please upload as InputFile, sending a String will not work.
3. Ports currently supported for Webhooks: 443, 80, 88, 8443.
=#

function setWebhook( url::UTF8String, certificate::InputFile )
end

#=
Use this method to send text messages. On success, the sent Message is returned.

    Parameters	                 Type                        Required	   Description
    chat_id	                     Integer or String	         Yes	       Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    text	                     String	                     Yes	       Text of the message to be sent
    parse_mode	                 String	                     Optional	   Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    disable_web_page_preview	 Boolean	                 Optional	   Disables link previews for links in this message
    disable_notification	     Boolean	                 Optional	   Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
    reply_to_message_id	         Integer	                 Optional	   If the message is a reply, ID of the original message
    reply_markup	             InlineKeyboardMarkup or     Optional	   Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
                                 ReplyKeyboardMarkup or
                                 ReplyKeyboardHide or
                                 ForceReply
=#
function sendMessage( chat_id::Union{ Int32, UTF8String }, text::UTF8String,
parse_mode::UTF8String, disable_web_page_preview::Bool, disable_notification::Bool,
reply_to_message_id::Int32, reply_markup::Union{ InlineKeyboardMarkup,
ReplyKeyboardMarkup, ReplyKeyboardHide, ForceReply } )
end
