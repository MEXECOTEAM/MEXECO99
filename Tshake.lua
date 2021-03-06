--[[
 __  __   ______ _  ___ ____ _  __   ___
|  \/  | / ____|\\  //   ||  | |/ / / _ \
| |\/| | /|  _|  \\//    ||  |   / | | | |
| |  | | \| |___ //\\    ||  | . \ | |_| |  
|_|  |_| \_____|//  \\  ____ |_|\_\ \___/
              CH > @MEXIC_TV
--]]
serpent = require('serpent')
serp = require 'serpent'.block
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
lgi = require ('lgi')
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
notify.init ("Telegram updates")
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_idkeko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_idkeko[1])
sudo_users = {sudo_add,bot_id}
URL33 = require('socket.url')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_tshake = database:smembers("files"..bot_id) 
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(files_tshake) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_tshake")
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
--         »»                 Start Functions                         ««              --
--         »»                 is_sudo                         ««              --
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if keko_add_sudo then var = true end return var
end
--         »»                 is_admin                         ««              --
function is_admin(msg)
user_id = msg.sender_user_id_
local var = false 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_admin                         ««              --
function ck_admin(user_id)
local var = false 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_creator                         ««              --
function is_creator(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) 
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_vip                         ««              --
function is_vip(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var end
--         »»                 is_owner                         ««              --
function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_mod                         ««              --
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
local var = false
local mod = database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('tshake:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
  }, cb, nil)
end
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'tshake:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
  tdcli_function ({
    ID = "GetChat",
    chat_id_ = chat_id
  }, dl_cb, nil)
end
--         »»                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
  }, cb, nil)
end
--         »»                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--         »»                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
  elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
  else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
  end
  return infile
end
--         »»                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
  tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
  }, dl_cb, nil)
end
--         »»                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
  --         »»                 getChatId                         ««              --
function getChatId(id)
  local chat = {}
  local id = tostring(id)
  if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
  else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         »»                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Left")
end
--         »»                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         »»                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--         »»                 do_notify                         ««              --
function do_notify (user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--         »»                 getParseMode                         ««              --
local function getParseMode(parse_mode)
  if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
  tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
  }, cb, nil)
end
--         »»                 sendContact                         ««              --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         »»                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
 end
--         »»                 getUserFull                         ««              --
function getUserFull(user_id,cb)
  tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
  }, cb, nil)
end
--         »»                 vardump                         ««              --
function vardump(value)
  print(serpent.block(value, {comment=false}))
end
--         »»                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         »»                 send                         ««              --
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  local text2 = text
  local text_key = database:get('key_ts'..bot_id)
  if text_key then
  if parse_mode then
  if parse_mode == 'markdown' or parse_mode == 'md' then
  parse_mode = "Markdown"
  elseif parse_mode == 'html' then
  parse_mode = "Html"
  end
  end
  local channel_ts = database:get("channel_ts"..bot_id)
  local channel_user_ts = database:get("channel_user_ts"..bot_id)
  keyboard = {}
  keyboard.inline_keyboard = {
  {
  {text = ''..(channel_ts or "TshAkE TEAM")..'', url=''..(channel_user_ts or 't.me/TshAkETEAM')..''},
  },
  }
  local keko = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
  if reply_to_message_id ~= 0 then
  keko = keko .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- جميع الحقوق محفوظه لفريق تشاكي لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
  end
  if disable_web_page_preview then
  keko = keko .. '&disable_web_page_preview=true'
  end
  if text then
  keko = keko..'&text='..URL33.escape(text2)
  end
  if parse_mode then
  keko = keko .. '&parse_mode='..parse_mode
  end
  keko = keko..'&reply_markup='..JSON.encode(keyboard)
  https.request(keko)
  else
  tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
--         »»                 changetitle                         ««              --
function changetitle(chat_id, title)
  tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
  }, dl_cb, nil)
end
--         »»                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
  }, dl_cb, nil)
end
--         »»                 setphoto                         ««              --
function setphoto(chat_id, photo)
  tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
  }, dl_cb, nil)
end
--         »»                 add_user                         ««              --
function add_user(chat_id, user_id, forward_limit)
  tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
  }, dl_cb, nil)
end
--         »»                 delmsg                         ««              --
function delmsg(arg,data)
  for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
  end
end
--         »»                 unpinmsg                         ««              --
function unpinmsg(channel_id)
  tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
  tdcli_function ({
  ID="DeleteMessages",
  chat_id_=chatid,
  message_ids_=mid
  },
  dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
  if not limit or limit > 200 then
limit = 200
  end
  tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
  }, dl_cb, nil)
end
--         »»                 getChannelFull                         ««              --
function getChannelFull(channel_id)
  tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
--         »»                 channel_get_bots                         ««              --

local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
  if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
  elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
  else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
  end
local inmsg = {}
local filetype = filetype:lower()
  if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
  elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
  elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
  elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
  elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
  elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
  elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
  }, dl_cb, nil)
end
--         »»                 getUser                         ««              --
function getUser(user_id, cb)
  tdcli_function ({
ID = "GetUser",
user_id_ = user_id
  }, cb, nil)
end
--         »»                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
   tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
   }, dl_cb, nil)
end
--         »»                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function keko333(extra,result,success)
info = '💬┇بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
 end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_tshakeX(tshakex1,tshakex2,tshakex3)
local id_tshakex = tshakex2.sender_user_id_
function keko333(extra,result,success)
info = '👤┇العضو ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
 end
getUser(id_tshakex, keko333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_tshakeX)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
info = '👤┇العضو ~⪼ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end -- end fun
--         »»                 End Functions                         ««              --
function TSadd(msg) -- Function add && rem
local text = msg.content_.text_
if (text == 'تعطيل') and not is_sudo(msg) then
function TSby(extra,result,success)
info = '💬┇بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info2(k1,k2)
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_ ,link.result) 
link = link.result 
else 
link = "(لا يوجد)"
end
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..link.."]" , 1, 'html')
end
openChat(msg.chat_id_,thsake_info2) 
--
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
-- end function
if (text == 'تفعيل') and not is_sudo(msg) then
function TSby(extra,result,success)
info = '💬┇بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(keko)
local data2 = json:decode(stats)
local kekon = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(kekon) or tonumber(data2.result) > tonumber(kekon))) then
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'tshake:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
function thsake_info2(k1,k2)
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_ ,link.result) 
link = link.result 
else 
link = "(لا يوجد)"
end
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..link.."]" , 1, 'html')
end
openChat(msg.chat_id_,thsake_info2) 
--
if data.result.can_promote_members  then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
end
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه قليله لا يمكن تفعيلها", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
if text == "تفعيل" and is_sudo(msg) then
function TSby(extra,result,success)
info = '💬┇بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'tshake:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
function thsake_info2(k1,k2)
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_ ,link.result) 
link = link.result 
else 
link = "(لا يوجد)"
end
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..link.."]" , 1, 'html')
end
openChat(msg.chat_id_,thsake_info2) 
--
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
if text == "تعطيل" and is_sudo(msg) then
function TSby(extra,result,success)
info = '💬┇بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'tshaketeam')..')\n'
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
--
function thsake_info2(k1,k2)
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_ ,link.result) 
link = link.result 
else 
link = "(لا يوجد)"
end
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..link.."]" , 1, 'html')
end
openChat(msg.chat_id_,thsake_info2) 
--
end 
end
getUser(msg.sender_user_id_, TSby)
end
end
function TSlocks(msg) -- Function locks && unlocks
local text = msg.content_.text_
if text then
--         »»               Start tshake lock                       ««              --
if (text == "قفل التاك") then
  local tsX_o = database:get("lock_tag:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل التاك")
  else
  tsX000("lock",msg,"☑┇تم قفل التاك")
  database:set("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الشارحه") then
  local tsX_o = database:get("lock_sarha:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الشارحه")
  else
  tsX000("lock",msg,"☑┇تم قفل الشارحه")
  database:set("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل التعديل") then
  local tsX_o = database:get("lock_edit:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل التعديل")
  else
  tsX000("lock",msg,"☑┇تم قفل التعديل")
  database:set("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل التكرار") then
  local tsX_o = database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل التكرار")
  else
  tsX000("lock",msg,"☑┇تم قفل التكرار")
  database:set("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل المتحركه") then
  local tsX_o = database:get("lock_gif:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل المتحركه")
  else
  tsX000("lock",msg,"☑┇تم قفل المتحركه")
  database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الملفات") then
  local tsX_o = database:get("lock_files:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الملفات")
  else
  tsX000("lock",msg,"☑┇تم قفل الملفات")
  database:set("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الماركدون") then
  local tsX_o = database:get("lock_mark:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الماركدون")
  else
  tsX000("lock",msg,"☑┇تم قفل الماركدون")
  database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الصور") then
  local tsX_o = database:get("lock_photo:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الصور")
  else
  tsX000("lock",msg,"☑┇تم قفل الصور")
  database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الملصقات") then
  local tsX_o = database:get("lock_stecker:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الملصقات")
  else
  tsX000("lock",msg,"☑┇تم قفل الملصقات")
  database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الفيديو") then
  local tsX_o = database:get("lock_video:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الفيديو")
  else
  tsX000("lock",msg,"☑┇تم قفل الفيديو")
  database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الانلاين") then
  local tsX_o = database:get("lock_inline:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الانلاين")
  else
  tsX000("lock",msg,"☑┇تم قفل الانلاين")
  database:set("lock_inline:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الدردشه") then
  local tsX_o = database:get("lock_chat:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الدردشه")
  else
  tsX000("lock",msg,"☑┇تم قفل الدردشه")
  database:set("lock_chat:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل التوجيه") then
  local tsX_o = database:get("lock_fwd:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل التوجيه")
  else
  tsX000("lock",msg,"☑┇تم قفل التوجيه")
  database:set("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل التثبيت") then
  local tsX_o = database:get("lock_pin:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل التثبيت")
  else
  tsX000("lock",msg,"☑┇تم قفل التثبيت")
  database:set("lock_pin:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الاغاني") then
  local tsX_o = database:get("lock_audeo:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الاغاني")
  else
  tsX000("lock",msg,"☑┇تم قفل الاغاني")
  database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الصوت") then
  local tsX_o = database:get("lock_voice:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الصوت")
  else
  tsX000("lock",msg,"☑┇تم قفل الصوت")
  database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الجهات") then
  local tsX_o = database:get("lock_contact:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الجهات")
  else
  tsX000("lock",msg,"☑┇تم قفل الجهات")
  database:set("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل العربيه") then
  local tsX_o = database:get("lock_ar:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
    tsX000("lock",msg,"☑┇بالفعل تم قفل العربيه")
  else
  tsX000("lock",msg,"☑┇تم قفل العربيه")
  database:set("lock_ar:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الانكليزيه") then
  local tsX_o = database:get("lock_en:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الانكليزيه")
  else
  tsX000("lock",msg,"☑┇تم قفل الانكليزيه")
  database:set("lock_en:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الميديا") then
  local tsX_o = database:get("lock_media:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الميديا")
  else
  tsX000("lock",msg,"☑┇تم قفل الميديا")
  database:set("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الروابط") then
  local tsX_o = database:get("lock_link:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
    tsX000("lock",msg,"☑┇بالفعل تم قفل الروابط")
  else
  tsX000("lock",msg,"☑┇تم قفل الروابط")
  database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل المعرف") then
  local tsX_o = database:get("lock_username:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
   tsX000("lock",msg,"☑┇بالفعل تم قفل المعرف")
  else
  tsX000("lock",msg,"☑┇تم قفل المعرف")
  database:set("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الاشعارات") then
  local tsX_o = database:get("lock_new:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل الاشعارات")
  else
  tsX000("lock",msg,"☑┇تم قفل الاشعارات")
  database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل البوتات بالطرد") then
  local tsX_o = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
   tsX000("lock",msg,"☑┇بالفعل تم قفل البوتات بالطرد")
  else
  tsX000("lock",msg,"☑┇تم قفل البوتات بالطرد")
  database:set("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل البوتات") then
  local tsX_o = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل البوتات")
  else
  tsX000("lock",msg,"☑┇تم قفل البوتات")
  database:set("lock_bot:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل بصمه الفيديو") then
  local tsX_o = database:get("lock_note:tshake"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم قفل بصمه فيديو")
  else
  tsX000("lock",msg,"☑┇تم قفل بصمه فيديو")
  database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  --         »»                 End tshake lock                         ««              --
  --         »»               Start tshake unlock                       ««              --
  if (text == "فتح الاشعارات") then
  local tsX_o = database:get("lock_new:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
   tsX000("lock",msg,"☑┇بالفعل تم فتح الاشعارات")
  else
  tsX000("lock",msg,"☑┇تم فتح الاشعارات")
  database:del("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح التاك") then
  local tsX_o = database:get("lock_tag:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح التاك")
  else
  tsX000("lock",msg,"☑┇تم فتح التاك")
  database:del("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الشارحه") then
  local tsX_o = database:get("lock_sarha:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الشارحه")
  else
  tsX000("lock",msg,"☑┇تم فتح الشارحه")
  database:del("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح التكرار") then
  local tsX_o = database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح التكرار")
  else
  tsX000("lock",msg,"☑┇تم فتح التكرار")
  database:del("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح التعديل") then
  local tsX_o = database:get("lock_edit:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح التعديل")
  else
  tsX000("lock",msg,"☑┇تم فتح التعديل")
  database:del("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح المتحركه") then
  local tsX_o = database:get("lock_gif:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
   tsX000("lock",msg,"☑┇بالفعل تم فتح المتحركه")
  else
  tsX000("lock",msg,"☑┇تم فتح المتحركه")
  database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الملفات") then
  local tsX_o = database:get("lock_files:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الملفات")
  else
  tsX000("lock",msg,"☑┇تم فتح الملفات")
  database:del("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الماركدون") then
  local tsX_o = database:get("lock_mark:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الماركدون")
  else
  tsX000("lock",msg,"☑┇تم فتح الماركدون")
  database:del("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الصور") then
  local tsX_o = database:get("lock_photo:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الصور")
  else
  tsX000("lock",msg,"☑┇تم فتح الصور")
  database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الملصقات") then
  local tsX_o = database:get("lock_stecker:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الملصقات")
  else
  tsX000("lock",msg,"☑┇تم فتح الملصقات")
  database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الفيديو") then
  local tsX_o = database:get("lock_video:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الفيديو")
  else
  tsX000("lock",msg,"☑┇تم فتح الفيديو")
  database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الانلاين") then
  local tsX_o = database:get("lock_inline:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الانلاين")
  else
  tsX000("lock",msg,"☑┇تم فتح الانلاين")
  database:del("lock_inline:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الدردشه") then
  local tsX_o = database:get("lock_chat:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الدردشه")
  else
  tsX000("lock",msg,"☑┇تم فتح الدردشه")
  database:del("lock_chat:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح التوجيه") then
  local tsX_o = database:get("lock_fwd:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح التوجيه")
  else
  tsX000("lock",msg,"☑┇تم فتح التوجيه")
  database:del("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح التثبيت") then
  local tsX_o = database:get("lock_pin:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح التثبيت")
  else
  tsX000("lock",msg,"☑┇تم فتح التثبيت")
  database:del("lock_pin:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الاغاني") then
  local tsX_o = database:get("lock_audeo:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الاغاني")
  else
  tsX000("lock",msg,"☑┇تم فتح الاغاني")
  database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الصوت") then
  local tsX_o = database:get("lock_voice:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الصوت")
  else
  tsX000("lock",msg,"☑┇تم فتح الصوت")
  database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح البوتات بالطرد") then
  local tsX_o = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح البوتات بالطرد")
  else
  tsX000("lock",msg,"☑┇تم فتح البوتات بالطرد")
  database:del("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الجهات") then
  local tsX_o = database:get("lock_contact:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الجهات")
  else
  tsX000("lock",msg,"☑┇تم فتح الجهات")
  database:del("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح العربيه") then
  local tsX_o = database:get("lock_ar:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح العربيه")
  else
  tsX000("lock",msg,"☑┇تم فتح العربيه")
  database:del("lock_ar:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الانكليزيه") then
  local tsX_o = database:get("lock_en:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الانكليزيه")
  else
  tsX000("lock",msg,"☑┇تم فتح الانكليزيه")
  database:del("lock_en:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الميديا") then
  local tsX_o = database:get("lock_media:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الميديا")
  else
  tsX000("lock",msg,"☑┇تم فتح الميديا")
  database:del("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح المعرف") then
  local tsX_o = database:get("lock_username:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح المعرف")
  else
  tsX000("lock",msg,"☑┇تم فتح المعرف")
  database:del("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح بصمه الفيديو") then
  local tsX_o = database:get("lock_note:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح بصمه فيديو")
  else
  tsX000("lock",msg,"☑┇تم فتح بصمه فيديو")
  database:del("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الروابط") then
  local tsX_o = database:get("lock_link:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑┇بالفعل تم فتح الروابط")
  else
  tsX000("lock",msg,"☑┇تم فتح الروابط")
  database:del("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح البوتات") then
  local tsX_o = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
  if not tsX_o then
   tsX000("lock",msg,"☑┇بالفعل تم فتح البوتات")
  else
  tsX000("lock",msg,"☑┇تم فتح البوتات")
  database:del("lock_bot:tshake"..msg.chat_id_..bot_id,"ok")
  end
  end  --         »»               End tshake unlock                       ««              --
  end 
end 
  --         »»               Start Function Check Msg                       ««              --
function TSCheckMsg(msg) 
local text = msg.content_.text_
local text = msg.content_.text_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if database:get("lock_chat:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "Tshake"
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
end
if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
end
if msg.content_.ID == "MessageSticker" then
if database:get("lock_stecker:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end

if msg.content_.ID == "MessageChatAddMembers" then
database:incr('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageContact" then
if database:get("lock_contact:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end

if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
end
end
end
end

if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id) then
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'tshake:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
send(msg.chat_id_, msg.id_, 1, '🎫┇الايدي ~⪼*('..msg.sender_user_id_..')* \n❕┇قمت بعمل تكرار للرسائل المحدده\n☑┇وتم كتمك في المجموعه\n', 1, 'md')
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "tshake"
end
end -- end fun
  --         »»               Start Function Sudo                       ««              --
function TSsudo(msg)
text = msg.content_.text_
if msg.content_.text_ then
if text:match("^مغادره$") then
if not database:get('tshake:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "☑┇تم مغادره المجموعه", 1, 'md')
else
end
end
if text == "رفع منشئ" and msg.reply_to_message_id_ then
function setcreator_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم رفع منشئ في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم رفع منشئ في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setcreator_by_reply)
end
if text:match("^رفع منشئ @(.*)$")  then
local apow = {string.match(text, "^(رفع منشئ) @(.*)$")}
function setcreator_by_username(extra, result, success)
if result.id_ then
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'tshaketeam')..')\n☑┇تم رفع منشئ في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setcreator_by_username)
end
if text:match("^رفع منشئ (%d+)$") then
local apow = {string.match(text, "^(رفع منشئ) (%d+)$")}
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, apow[2])
  tsX000(apow[2],msg,"☑┇تم رفع منشئ في البوت")
end
if text:match("^تنزيل منشئ$") and msg.reply_to_message_id_ then
function decreator_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم تنزيله من منشئين المجموعه")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم تنزيله من منشئين المجموعه")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,decreator_by_reply)
end
if text:match("^تنزيل منشئ @(.*)$") then
local apow = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
function remcreator_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'tshaketeam')..')\n☑┇تم تنزيله من منشئين المجموعه'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remcreator_by_username)
end
if text:match("^تنزيل منشئ (%d+)$") then
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
database:srem(hash, apow[2])
  tsX000(apow[2],msg,"☑┇تم تنزيله من منشئين المجموعه")
end--
if text:match("^المنشئين") then
local hash =   'tshake:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅┇قائمة المنشئين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد منشئين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end--
if text:match("^اذاعه (.*)$") then
local ssss = {string.match(text, "^(اذاعه) (.*)$")}
if not database:get('tshake:'..bot_id..'bc:groups') then
local gps = database:scard( 'tshake:'..bot_id.."groups") or 0
local gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
send(gpss[i], 0, 1, ssss[2], 1, 'html')		
end					
end
local pro = database:scard('tshake:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله في {'..(gps - pro)..'} مجموعه ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
end
if text:match("^عدد الكروبات$") or text:match("^الاحصائيات$") then
local gps = database:scard('tshake:'..bot_id.."groups") or 0
local user = database:scard('tshake:'..bot_id.."userss") or 0
local gps2 = database:scard("thsake:gog"..bot_id) or 0
local gps3 = database:scard('tshake:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '• المجموعات :\n📊┇عدد الكروبات الكلي ~⪼  *{'..gps..'}*\n🔋┇عدد الكروبات المفعله ~⪼  *{'..gps2..'}*\n🔌┇عدد الكروبات الغير مفعله ~⪼  *{'..(gps - gps2)..'}*\n💡┇عدد الكروبات المدفوعه ~⪼  *{'..(gps3)..'}*\n\n• الاعضاء :\n👥┇ عدد اعضاء الخاص : {`'..user..'`}', 1, 'md')
end
if tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
if text:match("^تفعيل الكل$") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("thsake:gog"..bot_id, gps[i])
database:set('tshake:'..bot_id.."enable:"..gps[i],true)
database:set( 'tshake:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '🔋┇تم تفعيل ~⪼  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
if text:match("^تعطيل الكل$") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:del("thsake:gog"..bot_id)
database:del('tshake:'..bot_id.."enable:"..gps[i])
database:del( 'tshake:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ~⪼  *{'..#gps..'}*', 1, 'md')
end
if text:match("^مغادره الكل$") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '💣┇تم مغادره ~⪼  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('tshake:'..bot_id.."enable:"..gps[i])
chat_leave(msg.chat_id_, bot_id)
end
database:del("thsake:gog"..bot_id)
database:del('tshake:'..bot_id.."groups")
end
end --
if text:match("^روابط الكروبات$") then
local gpss = database:smembers("thsake:"..bot_id.."groups") or 0
local gps = database:scard('tshake:'..bot_id.."groups")
text = '📊┇روابط الكروبات\n\n'
for i=1, #gpss do
local link = database:get('tshake:'..bot_id.."group:link"..gpss[i])
text = text.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
 local f = io.open('TshAkE.txt', 'w')
 f:write(text)
 f:close()
 local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
 local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'TshAkE.txt' .. '"'
 io.popen(curl)
 end
if text:match("^تحديث السورس$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('cd libs && wget https://raw.githubusercontent.com/MEXECOTEAM/MEXECO99/master/libs/utils.lua')
os.execute('rm -rf Tshake.lua')
os.execute('wget https://raw.githubusercontent.com/MEXECOTEAM/MEXECO99/master/Tshake.lua')
os.exit()
return false
end
if text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'tshake:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘┇تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
if text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end

if text:match("^مغادره (-%d+)$")  then
local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🔘┇المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
send(txt[2], 0, 1, '❕┇هذه ليست ضمن المجموعات الخاصة بي', 1, 'md')
database:del("thsake:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
if text:match('^المده1 (-%d+)$')  then
local txt = {string.match(text, "^(المده1) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'tshake:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 30 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'tshake:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 90 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'tshake:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت لا نهائية \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if (msg.content_.text_ == 'الملفات' ) then
local files_tshake = database:smembers("files"..bot_id)
local keko = io.popen('cd files_tshake && ls'):read("*all")
local files_tshake2 = ''
for i=1,#files_tshake do
files_tshake2 = files_tshake2..'{'..files_tshake[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '☑┇جميع الملفات : \n '..keko..'\n ---------------------- \n\n✔┇الملفات المفعله \n'..files_tshake2..'', 1, 'html')
end
text = msg.content_.text_
if text then
if text:match("^(تفعيل ملف) (.*)(.lua)$")then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
function load(filename)
local f = io.open(filename)
if not f then
return "keko"
end
local s = f:read('*all')
f:close()
return s
end
local f = load("files_tshake/"..name_t[2]..".lua")
if f ~= "keko" then
if f:match("^(.*)(keko_tshake)(.*)$") then
database:sadd("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل {"..name_t[2]..".lua}", 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس تشاكي \n 🦁┇[ملفات يدعمها سورس تشاكي](t.me/tshakeFiles)', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس تشاكي \n 🦁┇[ملفات يدعمها سورس تشاكي](t.me/tshakeFiles)', 1, 'md')
end
end
if text:match("^(تعطيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(حذف ملف) (.*)(.lua)$")}
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖┇تم تعطيل {"..name_t[2]..".lua}", 1, 'html')
end
if (text:match("^(مسح جميع الملفات)$"))then
database:del("files"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🗑┇تم حذف جميع الملفات", 1, 'html')
end
if text:match("^(حذف ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(حذف ملف) (.*)(.lua)$")}
io.popen("rm -fr files_tshake/"..name_t[2]..'.lua')
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖┇تم حذف {"..name_t[2]..".lua}", 1, 'html')
end
if (msg.content_.text_ == 'اضف ملف' ) then
send(msg.chat_id_, msg.id_, 1, " 📥┇ ارسل ملف الان", 1, 'html')
database:set("addfiel"..msg.sender_user_id_,"yes")
end
if text:match("^(جلب ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(جلب ملف) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "🕡┇ انتظر بعض الوقت وسيتم جلب \n 📁┇ملف : {"..name_t[2]..".lua}", 1, 'html')
local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_tshake/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end
end -- end if sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if text then
  if (text and text == 'تفعيل الانلاين' ) then
  database:set('key_ts'..bot_id,"yes")
  send(msg.chat_id_, msg.id_, 1, "☑┇تم تفعيل خاصيه الازرار الشفافه", 1, 'html')
  end
  if (text and text == 'تعطيل الانلاين') then
  database:del('key_ts'..bot_id)
  send(msg.chat_id_, msg.id_, 1, "⚠┇تم تعطيل خاصيه الازرار الشفافه", 1, 'html')
  end
  if text:match("^(تغير نص الانلاين) (.*)$") then
  local name_t = {string.match(text, "^(تغير نص الانلاين) (.*)$")}
  database:set("channel_ts"..bot_id, name_t[2])
  send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير النص ~⪼ {"..name_t[2].."}", 1, 'html')
  end
 
  if text:match("^(تغير رابط الانلاين) [Hh][Tt][Tt][Pp](.*)$") then
  local name_t = {string.match(text, "^(تغير رابط الانلاين) (.*)$")}
  database:set("channel_user_ts"..bot_id, name_t[2])
  send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير الرابط ~⪼ {"..name_t[2].."}", 1, 'html')
  end
  end
  
end --sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text == 'تفعيل التفعيل التلقائي'then
database:set("add"..bot_id, "yes")
send(msg.chat_id_, msg.id_, 1, "☑┇تم تفعيل التفعيل التلقائي", 1, 'html')
end
if (text == 'تعطيل التفعيل التلقائي') then
database:del("add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "❎┇تم تعطيل التفعيل التلقائي", 1, 'html')
end
if text:match("^(تعين عدد الاعضاء) (.*)$") then
local kekoj = {string.match(text, "^(تعين عدد الاعضاء) (.*)$")}
database:set("ts_a"..bot_id,kekoj[2])
send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعين : "..kekoj[2], 1, 'html')
end
end
end
end -- end function sudo

function tshake_run_file(data)
local files_tshake = database:smembers("files"..bot_id)
for i=1,#files_tshake do
local tshakeee = dofile("files_tshake/"..files_tshake[i])
local kt = tshakeee.keko_tshake(data)
if kt == 'end' then
return false
end
end
end

function TSall(msg,data)
text = msg.content_.text_
if msg.content_.photo_ then
local photo = database:get('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if photo then
local idPh = nil
if msg.content_.photo_.sizes_[0] then
idPh = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
idPh = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
idPh = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[3] then
idPh = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
setphoto(msg.chat_id_, idPh)
send(msg.chat_id_, msg.id_, 1, '✔┇تم وضع صوره للمجموعه', 1, 'md')
database:del('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
if msg.date_ < (os.time() - 30) then
return false end
  if text then
  -------------------------------------------
  if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
  function get_mymsg_contact(extra, result, success)
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
  return false
  end
  if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
  if database:get( 'tshake:'..bot_id.."enable:"..msg.chat_id_) then
  database:del( 'tshake:'..bot_id.."enable:"..msg.chat_id_)
  for k,v in pairs(sudo_users) do
  end
  end
  end
    if msg.chat_id_ then
    local id = tostring(msg.chat_id_)
    if id:match('-100(%d+)') then
    if not database:sismember( 'tshake:'..bot_id.."groups",msg.chat_id_) then
    database:sadd( 'tshake:'..bot_id.."groups",msg.chat_id_)
    end
    elseif id:match('^(%d+)') then
    database:sadd('tshake:'..bot_id.."userss",msg.chat_id_)
    else
    if not database:sismember( 'tshake:'..bot_id.."groups",msg.chat_id_) then
    database:sadd( 'tshake:'..bot_id.."groups",msg.chat_id_)
    end
   end
  end
  if ((not d) and chat) then
  if msg.content_.ID == "MessageText" then
  do_notify (chat.title_, msg.content_.text_)
  else
  do_notify (chat.title_, msg.content_.ID)
  end
  end
  database:incr('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
  if database:get('tshake:'..bot_id..'viewget'..msg.sender_user_id_) then
  if not msg.forward_info_ then
  send(msg.chat_id_, msg.id_, 1, '❕┇قم بارسال المنشور من القناة', 1, 'md')
  database:del('tshake:'..bot_id..'viewget'..msg.sender_user_id_)
  else
  send(msg.chat_id_, msg.id_, 1, '📊┇عدد المشاهدات ~⪼ <b>('..msg.views_..')</b> ', 1, 'html')
  database:del('tshake:'..bot_id..'viewget'..msg.sender_user_id_)
  end
  end
  if msg.content_.members_ then
  if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
  chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
  return false
  end
end
  if text:match('(.*)') then
  os.execute('cd .. &&  rm -fr ../.telegram-cli')
  os.execute('cd .. &&  rm -rf ../.telegram-cli')
  os.execute('cd .. &&  rm -rf .telegram-cli')
  os.execute('cd .. &&  rm -fr .telegram-cli')
  end
  
  if text:match("^رفع ادمن$")  and is_owner(msg) and msg.reply_to_message_id_ then
  function promote_by_reply(extra, result, success)
  local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
  if database:sismember(hash, result.sender_user_id_) then
  tsX000("prore",msg,'☑┇بالفعل تم رفعه ادمن')
  else
  database:sadd(hash, result.sender_user_id_)
  tsX000("prore",msg,'☑┇تم رفعه ادمن')
  end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
  end
  if text:match("^رفع ادمن @(.*)$") and is_owner(msg) then
  local apmd = {string.match(text, "^(رفع ادمن) @(.*)$")}
  function promote_by_username(extra, result, success)
  if result.id_ then
  database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n☑┇تم رفعه ادمن'
  else
  texts = '✖┇خطاء'
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apmd[2],promote_by_username)
  end
  if text:match("^رفع ادمن (%d+)$") and is_owner(msg) then
  local apmd = {string.match(text, "^(رفع ادمن) (%d+)$")}
  database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
  tsX000(apmd[2],msg,"☑┇تم رفعه ادمن")
  end
  if text:match("^تنزيل ادمن$") and is_owner(msg) and msg.reply_to_message_id_ then
  function demote_by_reply(extra, result, success)
  local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
  if not database:sismember(hash, result.sender_user_id_) then
    tsX000("prore",msg,"☑┇ بالفعل تم تنزيله من ادمنيه البوت")
  else
  database:srem(hash, result.sender_user_id_)
      tsX000("prore",msg,"☑┇ تم تنزيله من ادمنيه البوت")
  end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
  end
  if text:match("^تنزيل ادمن @(.*)$") and is_owner(msg) then
  local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
  local apmd = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
  function demote_by_username(extra, result, success)
  if result.id_ then
  database:srem(hash, result.id_)
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n☑┇تم تنزيله من ادمنيه البوت'
  else
  texts = '✖┇خطاء'
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apmd[2],demote_by_username)
  end
  if text:match("^تنزيل ادمن (%d+)$") and is_owner(msg) then
  local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
  local apmd = {string.match(text, "^(تنزيل ادمن) (%d+)$")}
  database:srem(hash, apmd[2])
    tsX000(apmd[2],msg,"☑┇ تم تنزيله من ادمنيه البوت")
  end
  if (text:match("^رفع عضو مميز$") or text:match("^رفع مميز$"))  and is_owner(msg) and msg.reply_to_message_id_ then
  function promote_by_reply(extra, result, success)
  local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
  if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم رفعه عضو مميز") 
 else
  database:sadd(hash, result.sender_user_id_)
   tsX000("prore",msg,"☑┇تم رفعه عضو مميز")
 end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
  end
  local text = text:gsub('رفع مميز','رفع عضو مميز')
  if text:match("^رفع عضو مميز @(.*)$") and is_owner(msg) then
  local apmd = {string.match(text, "^(رفع عضو مميز) @(.*)$")}
  function promote_by_username(extra, result, success)
  if result.id_ then
  database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n☑┇تم رفعه عضو مميز'
  else
  texts = '✖┇خطاء'
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apmd[2],promote_by_username)
  end
  local text = text:gsub('رفع مميز','رفع عضو مميز')
  if text:match("^رفع عضو مميز (%d+)$") and is_owner(msg) then
  local apmd = {string.match(text, "^(رفع عضو مميز) (%d+)$")}
  database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
	tsX000(apmd[2],msg,"☑┇تم رفعه عضو مميز")
  end
  if text and text == "تعين الايدي" and is_owner(msg) then
  send(msg.chat_id_, msg.id_, 1,  '☑┇ ارسل الان النص\n☑┇ يمكنك اضافه :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات', 1, 'md')
  database:set("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'tshake')
  return "tshake"
  end
  if text and is_owner(msg) and database:get("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
  database:del("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
  send(msg.chat_id_, msg.id_, 1,  '☑┇ تم الحفض بنجاح', 1, 'md')
  database:set("tshake:gr:id:text:"..bot_id..msg.chat_id_,text)
  end
  if text and text == "مسح الايدي" and is_owner(msg) then
  send(msg.chat_id_, msg.id_, 1,  '✖┇ تم المسح بنجاح', 1, 'md')
  database:del("tshake:gr:id:text:"..bot_id..msg.chat_id_)
  end
  if (text:match("^تنزيل عضو مميز$") or text:match("^تنزيل مميز$")) and is_owner(msg) and msg.reply_to_message_id_ then
  function demote_by_reply(extra, result, success)
  local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
  if not database:sismember(hash, result.sender_user_id_) then
  send(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..result.sender_user_id_..')* \n ☑┇بالفعل تم تنزيله من اعضاء الممزين البوت', 1, 'md')
  tsX000("prore",msg,"☑┇بالفعل تم تنزيله من اعضاء الممزين البوت")  
  else
     database:srem(hash, result.sender_user_id_)
      tsX000("prore",msg,"☑┇تم تنزيله من اعضاء الممزين البوت")
	end
    end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
  end
  local text = text:gsub('تنزيل مميز','تنزيل عضو مميز')
    if text:match("^تنزيل عضو مميز @(.*)$") and is_owner(msg) then
    local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
    local apmd = {string.match(text, "^(تنزيل عضو مميز) @(.*)$")}
    function demote_by_username(extra, result, success)
    if result.id_ then
     database:srem(hash, result.id_)
	  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n☑┇تم تنزيله من اعضاء الممزين البوت'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apmd[2],demote_by_username)
  end
  local text = text:gsub('تنزيل مميز','تنزيل عضو مميز')
  if text:match("^تنزيل عضو مميز (%d+)$") and is_owner(msg) then
  local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
  local apmd = {string.match(text, "^(تنزيل عضو مميز) (%d+)$")}
  database:srem(hash, apmd[2])
  tsX000(apmd[2],msg,"☑┇تم تنزيله من اعضاء الممزين البوت")
  end  
    if text:match("^حظر$") and is_mod(msg) and msg.reply_to_message_id_ ~= 0 then
    function ban_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
    if ck_mod(result.sender_user_id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  if database:sismember(hash, result.sender_user_id_) then
        tsX000("prore",msg,"☑┇بالفعل تم حظره من المجموعه")
 chat_kick(result.chat_id_, result.sender_user_id_)
    else
     database:sadd(hash, result.sender_user_id_)
        tsX000("prore",msg,"☑┇تم حظره من المجموعه")
 chat_kick(result.chat_id_, result.sender_user_id_)
    end
  end
    end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
  end
    
    if text:match("^حظر @(.*)$") and is_mod(msg) then
    local apba = {string.match(text, "^(حظر) @(.*)$")}
    function ban_by_username(extra, result, success)
    if result.id_ then
    if ck_mod(result.id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
      database:sadd('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
      texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'tshaketeam')..')\n☑┇تم حظره من المجموعه'
   chat_kick(msg.chat_id_, result.id_)
    end
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apba[2],ban_by_username)
  end
    
    if text:match("^حظر (%d+)$") and is_mod(msg) then
    local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
    if ck_mod(apba[2], msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
      database:sadd('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
       chat_kick(msg.chat_id_, apba[2])  
	   tsX000(apba[2],msg,"☑┇تم حظره من المجموعه")
    end
  end
    ----------------------------------------------unban--------------------------------------------
     if text:match("^الغاء حظر$") and is_mod(msg) and msg.reply_to_message_id_ then
   function unban_by_reply(extra, result, success)
   local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
   if not database:sismember(hash, result.sender_user_id_) then
    tsX000("prore",msg,"☑┇بالفعل تم الغاء حظره من البوت")
   else
     database:srem(hash, result.sender_user_id_)
       tsX000("prore",msg,"☑┇تم الغاء حظره من البوت")
   end
  end
   getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
  end
  if database:get('tshake:'..bot_id.."group:link"..msg.chat_id_) == 'Waiting For Link!\nPls Send Group Link' and is_mod(msg) then 
  if text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)") then   
  local glink = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)") 
  local hash = 'tshake:'..bot_id.."group:link"..msg.chat_id_ 
  database:set(hash,glink) 
  send(msg.chat_id_, msg.id_, 1, '☑️┇تم وضع رابط', 1, 'md') 
  send(msg.chat_id_, 0, 1, '↙️┇رابط المجموعه الجديد\n'..glink, 1, 'html')
  end 
end
   if text:match("^الغاء حظر @(.*)$") and is_mod(msg) then
   local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
   function unban_by_username(extra, result, success)
   if result.id_ then
     database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'tshaketeam')..')\n☑┇تم الغاء حظره من البوت' 
  else
    texts = '✖┇خطاء'
  end
      send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
   resolve_username(apba[2],unban_by_username)
  end
   
   if text:match("^الغاء حظر (%d+)$") and is_mod(msg) then
   local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
     database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
      tsX000(apba[2],msg,"☑┇تم الغاء حظره من البوت") 
    end

     if text:match("^الغاء حظر$") and is_mod(msg) and msg.reply_to_message_id_ then
   function moody(extra, result, success)
   function unban_by_reply(extra, result, success)
   local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
     database:srem(hash, result.sender_user_id_)
  bot.changeChatMemberStatus(msg.chat_id_, result.sender_user_id_, "Left")
   end
   getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
  end
   bot.channel_get_kicked(msg.chat_id_,moody)
   end
   
   if text:match("^الغاء حظر @(.*)$") and is_mod(msg) then
   local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
   function moody(extra, result, success)
   function unban_by_username(extra, result, success)
   if result.id_ then
     database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
  bot.changeChatMemberStatus(msg.chat_id_, result.id_, "Left")
  else
  end
      send(msg.chat_id_, msg.id_, 1, txxt, 1, 'html')
  end
   resolve_username(apba[2],unban_by_username)
  end
   bot.channel_get_kicked(msg.chat_id_,moody)
   end
   
   if text:match("^الغاء حظر (%d+)$") and is_mod(msg) then
   local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
   function moody(extra, result, success)
     database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
  bot.changeChatMemberStatus(msg.chat_id_, apba[2], "Left")
    end
   bot.channel_get_kicked(msg.chat_id_,moody)
   end
    
    if text:match("^حذف الكل$") and is_owner(msg) and msg.reply_to_message_id_ then
    function delall_by_reply(extra, result, success)
    if ck_mod(result.sender_user_id_, msg.chat_id_) then
     send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع مسح رسائل \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..result.sender_user_id_..')* \n🗑┇تم حذف كل رسائله\n', 1, 'md')
      del_all_msgs(result.chat_id_, result.sender_user_id_)
  end
    end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
  end
    
    if text:match("^حذف الكل (%d+)$") and is_owner(msg) then
      local ass = {string.match(text, "^(حذف الكل) (%d+)$")}
    if ck_mod(ass[2], msg.chat_id_) then
     send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع مسح رسائل \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
         del_all_msgs(msg.chat_id_, ass[2])
     send(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..ass[2]..')* \n🗑┇تم حذف كل رسائله\n', 1, 'md')
    end
    end
   
    if text:match("^حذف الكل @(.*)$") and is_owner(msg) then
    local apbll = {string.match(text, "^(حذف الكل) @(.*)$")}
    function delall_by_username(extra, result, success)
    if result.id_ then
    if ck_mod(result.id_, msg.chat_id_) then
     send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع مسح رسائل \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  return false
  end
           del_all_msgs(msg.chat_id_, result.id_)
    texts = '👤┇العضو ~⪼ ('..result.id_..') \n🗑┇تم حذف كل رسائله'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
  end
    resolve_username(apbll[2],delall_by_username)
  end
    -----------------------------------------banall--------------------------------------------------
  if text:match("^حظر عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
  function gban_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'gbanned:'
    if is_admin(result) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
    database:sadd(hash, result.sender_user_id_)
    chat_kick(result.chat_id_, result.sender_user_id_)
	tsX000("prore",msg,"🚫┇تم حظره من مجموعات البوت")
  end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
  end
  
  if text:match("^حظر عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apbll = {string.match(text, "^(حظر عام) @(.*)$")}
  function gban_by_username(extra, result, success)
    if result.id_ then
       if ck_admin(result.id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
    else
    local hash =  'tshake:'..bot_id..'gbanned:'
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'tshaketeam')..')\n🚫┇تم حظره من المجموعات البوت'
  database:sadd(hash, result.id_)
  end
    else
    texts = '✖┇خطاء'
  end
    send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apbll[2],gban_by_username)
  end

  if text:match("^حظر عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apbll = {string.match(text, "^(حظر عام) (%d+)$")}
    local hash =  'tshake:'..bot_id..'gbanned:'
       if ck_admin(apbll[2]) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
    else
      database:sadd(hash, apbll[2])
  tsX000(apbll[2],msg,"🚫┇تم حظره من المجموعات البوت")
  end
  end
  if text:match("^الغاء العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
  function ungban_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'gbanned:'
     tsX000("prore",msg,"🚫┇تم الغاء حظره من المجموعات البوت")
    database:srem(hash, result.sender_user_id_)
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
  end
  
  if text:match("^الغاء العام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apid = {string.match(text, "^(الغاء العام) @(.*)$")}
  function ungban_by_username(extra, result, success)
    local hash =  'tshake:'..bot_id..'gbanned:'
    if result.id_ then
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'tshaketeam')..')\n🚫┇تم الغاء حظره من المجموعات البوت'
  database:srem(hash, result.id_)
    else
    texts = '✖┇خطاء'
    end
    send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apid[2],ungban_by_username)
  end
  
  if text:match("^الغاء العام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apbll = {string.match(text, "^(الغاء العام) (%d+)$")}
  local hash =  'tshake:'..bot_id..'gbanned:'
    database:srem(hash, apbll[2])
	  tsX000(apbll[2],msg,"🚫┇تم الغاء حظره من مجموعات البوت")
  end
  
  if text:match("^كتم عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
  function gmute_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'gmuted:'
    if is_admin(result) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
    database:sadd(hash, result.sender_user_id_)
	tsX000("prore",msg,"🚫┇تم كتمه من المجموعات البوت")
  end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
  end
  
  if text:match("^كتم عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apbll = {string.match(text, "^(كتم عام) @(.*)$")}
  function gmute_by_username(extra, result, success)
    if result.id_ then
       if ck_admin(result.id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
    else
    local hash =  'tshake:'..bot_id..'gmuted:'
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'tshaketeam')..')\n🚫┇تم كتمه من المجموعات البوت'
  database:sadd(hash, result.id_)
  end
    else
    texts = '✖┇خطاء'
  end
    send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apbll[2],gmute_by_username)
  end

  if text:match("^كتم عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apbll = {string.match(text, "^(كتم عام) (%d+)$")}
    local hash =  'tshake:'..bot_id..'gmuted:'
       if ck_admin(apbll[2]) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم عام \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
    else
      database:sadd(hash, apbll[2])
  tsX000(apbll[2],msg,"🚫┇تم كتمه من المجموعات البوت")
  end
  end
  if text:match("^الغاء كتم العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
  function ungmute_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
    database:srem(hash, result.sender_user_id_)
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
  end
  
  if text:match("^الغاء كتم العام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
  function ungmute_by_username(extra, result, success)
    local hash =  'tshake:'..bot_id..'gmuted:'
    if result.id_ then
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'tshaketeam')..')\n🚫┇تم الغاء كتمه من المجموعات البوت'
  database:srem(hash, result.id_)
    else
    texts = '✖┇خطاء'
    end
    send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(apid[2],ungmute_by_username)
  end
  
  if text:match("^الغاء كتم العام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local apbll = {string.match(text, "^(الغاء كتم العام) (%d+)$")}
  local hash =  'tshake:'..bot_id..'gmuted:'
    database:srem(hash, apbll[2])
  tsX000(apbll[2],msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
  end
    
    if text:match("^كتم$") and is_mod(msg) and msg.reply_to_message_id_ ~= 0 then
    function mute_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'muted:'..msg.chat_id_
    if ck_mod(result.sender_user_id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم كتمه")
    else
     database:sadd(hash, result.sender_user_id_)
	 tsX000("prore",msg,"🚫┇تم كتمه من البوت")
    end
  end
    end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
  end
    
    if text:match("^كتم @(.*)$") and is_mod(msg) then
    local apsi = {string.match(text, "^(كتم) @(.*)$")}
    function mute_by_username(extra, result, success)
    if result.id_ then
    if ck_mod(result.id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع كتم \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
      database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
    texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apsi[2] or 'tshaketeam')..')\n🚫┇تم كتمه من البوت'
    end
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apsi[2],mute_by_username)
  end
    if text:match("^كتم (%d+)$") and is_mod(msg) then
    local apsi = {string.match(text, "^(كتم) (%d+)$")}
if ck_mod(apsi[2], msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع كتم \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم كتمه من البوت")
    end
  end
    if text:match("^الغاء كتم$") and is_mod(msg) and msg.reply_to_message_id_ then
    function unmute_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'muted:'..msg.chat_id_
    if not database:sismember(hash, result.sender_user_id_) then
	tsX000("prore",msg,"🚫┇بالفعل تم الغاء كتمه من البوت")
    else
     database:srem(hash, result.sender_user_id_)
	 tsX000("prore",msg,"🚫┇تم الغاء كتمه من البوت")
    end
  end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
  end
    if text:match("^الغاء كتم @(.*)$") and is_mod(msg) then
    local apsi = {string.match(text, "^(الغاء كتم) @(.*)$")}
    function unmute_by_username(extra, result, success)
    if result.id_ then
     database:srem('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
   texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apsi[2] or 'tshaketeam')..')\n🚫┇تم الغاء كتمه من البوت'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apsi[2],unmute_by_username)
  end
    
    if text:match("^الغاء كتم (%d+)$") and is_mod(msg) then
    local apsi = {string.match(text, "^(الغاء كتم) (%d+)$")}
      database:srem('tshake:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
	    tsX000(apsi[2],msg,"🚫┇تم الغاء كتمه من البوت")
    end
  
    if text:match("^طرد$") and msg.reply_to_message_id_ ~=0 and is_mod(msg) then
  function kick_reply(extra, result, success)
    if ck_mod(result.sender_user_id_, msg.chat_id_) then
     send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
    else
	tsX000("prore",msg,"🚫┇تم طرده من المجموعه")
    chat_kick(result.chat_id_, result.sender_user_id_)
    end
    end
     getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
    end
    
    if text:match("^طرد @(.*)$") and is_mod(msg) then
    local apki = {string.match(text, "^(طرد) @(.*)$")}
    function kick_by_username(extra, result, success)
    if result.id_ then
    if ck_mod(result.id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
    texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apki[2] or 'tshaketeam')..')\n🚫┇تم طرده من المجموعه'
       chat_kick(msg.chat_id_, result.id_)
    end
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apki[2],kick_by_username)
  end
    
    if text:match("^طرد (%d+)$") and is_mod(msg) then
	 local apki = {string.match(text, "^(طرد) (%d+)$")}
    if ck_mod(apki[2], msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
       chat_kick(msg.chat_id_, apki[2])
	     tsX000(apki[2],msg,"🚫┇تم طرده من المجموعه")
    end
  end
  
    if text:match("^رفع مدير$") and is_creator(msg) and msg.reply_to_message_id_ then
    function setowner_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
    if database:sismember(hash, result.sender_user_id_) then
	tsX000("prore",msg,"☑┇بالفعل تم رفع مدير في البوت")
    else
     database:sadd(hash, result.sender_user_id_)
	 tsX000("prore",msg,"☑┇تم رفع مدير في البوت")
    end
  end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
  end
    
    if text:match("^رفع مدير @(.*)$") and is_creator(msg) then
    local apow = {string.match(text, "^(رفع مدير) @(.*)$")}
    function setowner_by_username(extra, result, success)
    if result.id_ then
      database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'tshaketeam')..')\n☑┇تم رفع مدير في البوت'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apow[2],setowner_by_username)
  end
    
    if text:match("^رفع مدير (%d+)$") and is_creator(msg) then
    local apow = {string.match(text, "^(رفع مدير) (%d+)$")}
      database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, apow[2])
	    tsX000(apow[2],msg,"☑┇تم رفع مدير في البوت")
  end
    
    if text:match("^تنزيل مدير$") and is_creator(msg) and msg.reply_to_message_id_ then
    function deowner_by_reply(extra, result, success)
    local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
    if not database:sismember(hash, result.sender_user_id_) then
	tsX000("prore",msg,"☑┇بالفعل تم تنزيله من مدراء البوت")
    else
     database:srem(hash, result.sender_user_id_)
	 tsX000("prore",msg,"☑┇تم تنزيله من مدراء البوت")
    end
  end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
  end
    
    if text:match("^تنزيل مدير @(.*)$") and is_creator(msg) then
    local apow = {string.match(text, "^(تنزيل مدير) @(.*)$")}
    local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
    function remowner_by_username(extra, result, success)
    if result.id_ then
     database:srem(hash, result.id_)
    texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'tshaketeam')..')\n☑┇تم تنزيله من مدراء البوت'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apow[2],remowner_by_username)
  end
    
    if text:match("^تنزيل مدير (%d+)$") and is_creator(msg) then
    local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
    local apow = {string.match(text, "^(تنزيل مدير) (%d+)$")}
     database:srem(hash, apow[2])
	   tsX000(apow[2],msg,"☑┇تم تنزيله من مدراء البوت")
  end
    
  if  text:match("^الادمنيه$") and is_owner(msg) then
  local hash =   'tshake:'..bot_id..'mods:'..msg.chat_id_
    local list = database:smembers(hash)
    text = "👥┇قائمة الادمنيه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
    local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
  if user_info and user_info.username then
  local username = user_info.username
  text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
  else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
  end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد ادمنيه"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
  -----------------------------------------------
    if text:match("^الاعضاء المميزين") and is_owner(msg) then
  local hash =   'tshake:'..bot_id..'vipgp:'..msg.chat_id_
    local list = database:smembers(hash)
    text = "👥┇قائمة الاعضاء المميزين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
    local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
      if user_info and user_info.username then
        local username = user_info.username
        text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
  else
    text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
      end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
    end
    if #list == 0 then
   text = "✖┇لايوجد اعضاء مميزين"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
    end

  if text:match("^قائمه المنع$") and is_mod(msg) then
    local hash =  'tshake:'..bot_id..'filters:'..msg.chat_id_
  if hash then
     local names = database:hkeys(hash)
    text = "⚠┇قائمة الكلمات الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for i=1, #names do
   text = text.."<b>|"..i.."|</b>~⪼("..names[i]..")\n"
 
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
								end
    if #names == 0 then
  text = "✖┇لايوجد كلمات ممنوعه"
  end
  send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end
  end
    
    if text:match("^المكتومين$") and is_mod(msg) then
  local hash =   'tshake:'..bot_id..'muted:'..msg.chat_id_
    local list = database:smembers(hash)
     text = "🚫┇قائمة المكتومين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  for k,v in pairs(list) do
    local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
      if user_info and user_info.username then
        local username = user_info.username
        text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
  else
    text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
      end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد مكتومين"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
    
    if text:match("^المدراء$") and is_creator(msg) then
  local hash =   'tshake:'..bot_id..'owners:'..msg.chat_id_
    local list = database:smembers(hash)
    text = "🛄┇قائمة المدراء  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  for k,v in pairs(list) do
    local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
      if user_info and user_info.username then
        local username = user_info.username
        text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
  else
    text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
      end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد مدراء"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
    end

    if text:match("^المحظورين$") and is_mod(msg) then
  local hash =   'tshake:'..bot_id..'banned:'..msg.chat_id_
    local list = database:smembers(hash)
    text = "⛔┇قائمة المحظورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  for k,v in pairs(list) do
    local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
      if user_info and user_info.username then
        local username = user_info.username
        text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
  else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
      end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد محظورين"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end

    if  msg.content_.text_:match("^قائمه العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local hash =   'tshake:'..bot_id..'gbanned:'
  local list = database:smembers(hash)
    text = "⛔┇قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  for k,v in pairs(list) do
  local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
  if user_info and user_info.username then
  local username = user_info.username
  text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
   else
    text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
  end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
  end
  if #list == 0 then
  text = "✖┇لايوجد محظورين عام"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end

    if  msg.content_.text_:match("^المكتومين عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local hash =   'tshake:'..bot_id..'gmuted:'
  local list = database:smembers(hash)
    text = "⛔┇قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  for k,v in pairs(list) do
  local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
  if user_info and user_info.username then
  local username = user_info.username
  text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
   else
    text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
  end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
	text = ""
	end
  end
  if #list == 0 then
  text = "✖┇لايوجد مكتومين عام"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end

    
  if text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
  function id_by_reply(extra, result, success)
    send(msg.chat_id_, msg.id_, 1,result.sender_user_id_, 1, 'md')
    end
     getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
    end
    
  if text:match("^ايدي @(.*)$") then
    local ap = {string.match(text, "^(ايدي) @(.*)$")}
    function id_by_username(extra, result, success)
    if result.id_ then
  texts = result.id_
  else
  texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
  end
    resolve_username(ap[2],id_by_username)
  end
    
  if text:match("^جلب صوره (%d+)$") and msg.reply_to_message_id_ == 0 and not database:get('tshake:'..bot_id..'get:photo'..msg.chat_id_) then
local pronumb = {string.match(text, "^(جلب صوره) (%d+)$")}
local ph = pronumb[2] - 1
  local function gpro(extra, result, success)
     if result.photos_[ph] then
  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[ph].sizes_[1].photo_.persistent_id_)
     else
  send(msg.chat_id_, msg.id_, 1, "❕┇لا تملك صوره رقم <b>{"..pronumb[2].."}</b> في حسابك", 1, 'html')
     end
	 end
     tdcli_function ({
  ID = "GetUserProfilePhotos",
  user_id_ = msg.sender_user_id_,
  offset_ = 0,
  limit_ = pronumb[2]
    }, gpro, nil)
    end
    
    if text:match("^وضع تكرار (%d+)$") and is_owner(msg) then
    local floodmax = {string.match(text, "^(وضع تكرار) (%d+)$")}
    if tonumber(floodmax[2]) < 2 then
  send(msg.chat_id_, msg.id_, 1, '🔘┇ضع التكرار من *{2}* الى  *{99999}*', 1, 'md')
    else
  database:set('tshake:'..bot_id..'flood:max:'..msg.chat_id_,floodmax[2])
  send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع التكرار بالطرد للعدد ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
    end
  end
    
    if text:match("^وضع زمن التكرار (%d+)$") and is_owner(msg) then
    local floodt = {string.match(text, "^(وضع زمن التكرار) (%d+)$")}
    if tonumber(floodt[2]) < 1 then
  send(msg.chat_id_, msg.id_, 1, '🔘┇ضع العدد من *{1}* الى  *{99999}*', 1, 'md')
    else
  database:set('tshake:'..bot_id..'flood:time:'..msg.chat_id_,floodt[2])
     send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع الزمن التكرار للعدد ~⪼  *{'..floodt[2]..'}*', 1, 'md')
    end
    end
    
    if text:match("^وضع رابط$") and is_mod(msg) then
     database:set( 'tshake:'..bot_id.."group:link"..msg.chat_id_, 'Waiting For Link!\nPls Send Group Link')
     send(msg.chat_id_, msg.id_, 1, '📮┇قم بارسال الرابط  ليتم حفظه\n', 1, 'md')
    end
    
    if text:match("^الرابط$") then
    local link = database:get( 'tshake:'..bot_id.."group:link"..msg.chat_id_)
      if link then
    send(msg.chat_id_, msg.id_, 1, '📮┇رابط المجموعه\n'..link, 1, "html")
      else
    send(msg.chat_id_, msg.id_, 1, '🔘┇ ليتم حفظ الرابط ارسل { وضع الرابط } لحفظ الرابط الجديد', 1, 'html')
      end
     end
    -----------------------------------------------------------
    if text:match("^تفعيل الترحيب$") and is_mod(msg) then
     send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل الترحيب في المجموعه', 1, 'md')
       database:set('tshake:'..bot_id.."welcome"..msg.chat_id_,true)
    end
    if text:match("^تعطيل الترحيب$") and is_mod(msg) then
     send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل الترحيب في المجموعه', 1, 'md')
       database:del('tshake:'..bot_id.."welcome"..msg.chat_id_)
    end

    if text:match("^وضع ترحيب (.*)$") and is_mod(msg) then
    local welcome = {string.match(text, "^(وضع ترحيب) (.*)$")}
     send(msg.chat_id_, msg.id_, 1, '☑┇تم وضع ترحيب\n📜┇~⪼('..welcome[2]..')', 1, 'md')
       database:set('tshake:'..bot_id..'welcome:'..msg.chat_id_,welcome[2])
    end
    if text:match("^حذف الترحيب$") and is_mod(msg) then
    send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الترحيب', 1, 'md')
       database:del('tshake:'..bot_id..'welcome:'..msg.chat_id_)
    end
      if text:match("^جلب الترحيب$") and is_mod(msg) then
    local wel = database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_)
    if wel then
     send(msg.chat_id_, msg.id_, 1, '📜┇الترحيب\n~⪼('..wel..')', 1, 'md')
  else
     send(msg.chat_id_, msg.id_, 1, '✖┇لم يتم وضع ترحيب للمجموعه\n', 1, 'md')
    end
    end
    
    if text:match("^منع (.*)$") and is_mod(msg) then
    local filters = {string.match(text, "^(منع) (.*)$")}
  local name = string.sub(filters[2], 1, 50)
  database:hset('tshake:'..bot_id..'filters:'..msg.chat_id_, name, 'filtered')
          send(msg.chat_id_, msg.id_, 1, "☑┇تم اضافتها لقائمه المنع\n🔘┇{"..name.."}", 1, 'md')
    end
    
    if text:match("^الغاء منع (.*)$") and is_mod(msg) then
    local rws = {string.match(text, "^(الغاء منع) (.*)$")}
  local name = string.sub(rws[2], 1, 50)
  database:hdel('tshake:'..bot_id..'filters:'..msg.chat_id_, rws[2])
          send(msg.chat_id_, msg.id_, 1, "☑┇تم حذفها من لقائمه المنع\n🔘┇{"..rws[2].."}", 1, 'md')
    end
    
    if text:match("^ارسال (.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local gps = database:scard( 'tshake:'..bot_id.."groups") or 0
  local gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
    local rws = {string.match(text, "^(ارسال) (.*)$")}
    for i=1, #gpss do
	if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
        send(gpss[i], 0, 1, rws[2], 1, 'html')
		end
    end
  send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله في {'..gps..'} مجموعه ', 1, 'md')
    end
  if (text:match("^كشف البوتات$") or text:match("^البوتات$")) and is_mod(msg) then
     local txt = {string.match(text, "^كشف البوتات$")}
     local function cb(extra,result,success)
     local list = result.members_
    text = '📊┇البوتات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
   local n = 0
     for k,v in pairs(list) do
	 if v.user_id_ ~= bot_id then
   n = (n + 1)
     local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
  if user_info and user_info.username then
   local username = user_info.username
   text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
  else
   text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
  end
  end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
     end
	 if #list ~= 0 then
   send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   else
   send(msg.chat_id_, msg.id_, 1, "📊┇لا توجد بوتات في المجموعه", 1, 'html')
   end
   end
  bot.channel_get_bots(msg.chat_id_,cb)
   end
    

  if  text:match("^رسائلي$") and msg.reply_to_message_id_ == 0  then
  local user_msgs = database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
   if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "📨┇عدد رسالئلك ~⪼ *{"..user_msgs.."}*", 1, 'md')
  else
    end
    end

  if  text:match("^جهاتي$") then
add = (tonumber(database:get('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
  send(msg.chat_id_, msg.id_, 1, "📨┇عدد اضافه جهاتك ~⪼ *{"..add.."}*\n📨┇سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
  end
  if text:match("^(عدد السحكات)$") or text:match("^(سحكاتي)$") then
  local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
  send(msg.chat_id_, msg.id_, 1, "📨┇عدد سحكاتك ~⪼ *{"..edit.."}*", 1, 'md')
  end
  if text:match("^مسح قائمه العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  text = '☑┇تم مسح قائمه العام'
  database:del('tshake:'..bot_id..'gbanned:')
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
    end

  if text:match("^مسح المكتومين عام") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  text = '☑┇ تم مسح المكتومين عام'
  database:del('tshake:'..bot_id..'gmuted:')
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
    end

    
  if text:match("^مسح (.*)$") and is_mod(msg) then
  local txt = {string.match(text, "^(مسح) (.*)$")}
  if txt[2] == 'banlist' or txt[2] == 'Banlist' or txt[2] == 'المحظورين' then
  database:del('tshake:'..bot_id..'banned:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح المحظورين  من البوت ', 1, 'md')
  end
  if txt[2] == 'creators' and is_sudo(msg) or txt[2] == 'creatorlist' and is_sudo(msg) or txt[2] == 'Creatorlist' and is_sudo(msg) or txt[2] == 'Creators' and is_sudo(msg) or txt[2] == 'المنشئين' and is_sudo(msg) then
  database:del('tshake:'..bot_id..'creator:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه المنشئين', 1, 'md')
  end
  if txt[2] == 'البوتات' then
  local function cb(extra,result,success)
  local bots = result.members_
  for i=0 , #bots do
  if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
  end
  end
  end
  bot.channel_get_bots(msg.chat_id_,cb)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح جميع البوتات', 1, 'md')
  end
  if txt[2] == 'الادمنيه' and is_owner(msg) then
  database:del('tshake:'..bot_id..'mods:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه الادمنيه', 1, 'md')
  end
  if  txt[2] == 'الاعضاء المميزين' and is_owner(msg) then
  database:del('tshake:'..bot_id..'vipgp:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه الاعضاء المميزين', 1, 'md')
  end
  if  txt[2] == 'المميزين' and is_owner(msg) then
  database:del('tshake:'..bot_id..'vipgp:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه الاعضاء المميزين', 1, 'md')
  end
  if  txt[2] == 'المدراء' and is_creator(msg) then
  database:del('tshake:'..bot_id..'owners:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه المدراء', 1, 'md')
  end
  if  txt[2] == 'القوانين' then
  database:del('tshake:'..bot_id..'rules'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح القوانين المحفوظه', 1, 'md')
  end
  if txt[2] == 'الرابط' then
  database:del('tshake:'..bot_id..'group:link'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح الرابط المحفوظ', 1, 'md')
  end
  if txt[2] == 'قائمه المنع' then
  database:del('tshake:'..bot_id..'filters:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه المنع', 1, 'md')
  end
  if  txt[2] == 'المكتومين' then
  database:del('tshake:'..bot_id..'muted:'..msg.chat_id_)
  send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه المكتومين', 1, 'md')
  end
  end

  if text:match("^تنظيف قائمه المحظورين$") and is_creator(msg) then
  local txt = {string.match(text, "^(تنظيف قائمه المحظورين)$")}
  local function cb(extra,result,success)
  local list = result.members_
  for i=0 , #list do
  bot.changeChatMemberStatus(msg.chat_id_, list[i].user_id_, "Left")
  end
  text = '☑┇تم تنظيف قائمه المحظورين في المجموعه '
  send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  bot.channel_get_kicked(msg.chat_id_,cb)
  end
  if text:match("^اضافه قائمه المحظورين$") and is_creator(msg) then
  local txt = {string.match(text, "^(اضافه قائمه المحظورين)$")}
  local function cb(extra,result,success)
  local list = result.members_
  for k,v in pairs(list) do
  bot.addChatMember(msg.chat_id_, v.user_id_, 200, dl_cb, nil)
  end
  text = '☑┇تم اضافه قائمه المحظورين للمجموعه'
  send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  bot.channel_get_kicked(msg.chat_id_,cb)
  end
  if text:match("^طرد المحذوفين$") and is_creator(msg) then
  local txt = {string.match(text, "^(طرد المحذوفين)$")}
  local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
  local channel_id = chat_id:gsub('-100', '')
  chat = {ID = channel_id, type = 'channel'}
  else
  local group_id = chat_id:gsub('-', '')
  chat = {ID = group_id, type = 'group'}
  end
  return chat
  end
  local function check_delete(arg, data)
  for k, v in pairs(data.members_) do
  local function clean_cb(arg, data)
  if not data.first_name_ then
  bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
  end
  end
  bot.getUser(v.user_id_, clean_cb)
  end
  text = '☑┇تم طرد الحسابات المحذوفه'
  send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
  end

  if text:match("^طرد المتروكين$") and is_creator(msg) then
  local txt = {string.match(text, "^(طرد المتروكين)$")}
  local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
  local channel_id = chat_id:gsub('-100', '')
  chat = {ID = channel_id, type = 'channel'}
  else
  local group_id = chat_id:gsub('-', '')
  chat = {ID = group_id, type = 'group'}
  end
  return chat
  end
  local function check_deactive(arg, data)
  for k, v in pairs(data.members_) do
  local function clean_cb(arg, data)
  if data.type_.ID == "UserTypeGeneral" then
  if data.status_.ID == "UserStatusEmpty" then
  bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
  end
  end
  end
  bot.getUser(v.user_id_, clean_cb)
  end
  text = '☑┇تم طرد الحسابات المتروكة من المجموعة'
  send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
  end

  if text:match("^ادمنيه المجموعه$") and is_owner(msg) then
     local txt = {string.match(text, "^ادمنيه المجموعه$")}
     local function cb(extra,result,success)
     local list = result.members_
    text = '📊┇ادمنيه الكروب\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
   local n = 0
     for k,v in pairs(list) do
   n = (n + 1)
     local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
  if user_info and user_info.username then
   local username = user_info.username
   text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
  else
   text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
  end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
     end
   send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end
    bot.channel_get_admins(msg.chat_id_,cb)
   end

      if text:match("^رفع الادمنيه$") and is_owner(msg) then
    local txt = {string.match(text, "^رفع الادمنيه$")}
    local function cb(extra,result,success)
    local list = result.members_
  moody = '📊┇ تم رفع ادمنيه المجموعه في البوت\n'
  local n = 0
  for k,v in pairs(list) do
  n = (n + 1)
  local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
  database:sadd(hash, v.user_id_)
  end
  send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
  end
   bot.channel_get_admins(msg.chat_id_,cb)
  end
       if text:match("^الاعدادات$") and is_mod(msg) then
    if database:get("lock_media:tshake"..msg.chat_id_..bot_id) then
       mute_all = '✔┇'
       else
       mute_all = '✖┇'
       end
       ------------
       if database:get("lock_chat:tshake"..msg.chat_id_..bot_id) then
       mute_text = '✔┇'
       else
       mute_text = '✖┇'
       end
       ------------
       if database:get("lock_photo:tshake"..msg.chat_id_..bot_id) then
       mute_photo = '✔┇'
       else
       mute_photo = '✖┇'
       end
       ------------
       if database:get("lock_video:tshake"..msg.chat_id_..bot_id) then
       mute_video = '✔┇'
       else
       mute_video = '✖┇'
       end
       if database:get("lock_note:tshake"..msg.chat_id_..bot_id) then
       mute_note = '✔┇'
       else
       mute_note = '✖┇'
       end
       ------------
       if database:get("lock_gif:tshake"..msg.chat_id_..bot_id) then
       mute_gifs = '✔┇'
       else
       mute_gifs = '✖┇'
       end
       ------------
       if not database:get('tshake:'..bot_id..'flood:max:'..msg.chat_id_) then
       flood_m = 10
       else
       flood_m = database:get('tshake:'..bot_id..'flood:max:'..msg.chat_id_)
     end
       if not database:get( 'tshake:'..bot_id..'flood:time:'..msg.chat_id_) then
       flood_t = 10
       else
       flood_t = database:get( 'tshake:'..bot_id..'flood:time:'..msg.chat_id_)
     end
       ------------
       if database:get("lock_audeo:tshake"..msg.chat_id_..bot_id) then
       mute_music = '✔┇'
       else
       mute_music = '✖┇'
       end
       ------------
       if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) then
       mute_bots = '✔┇'
       else
       mute_bots = '✖┇'
       end

       if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
       mute_botsb = '✔┇'
       else
       mute_botsb = '✖┇'
       end

       if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id) then
       mute_flood = '✔┇'
       else
       mute_flood = '✖┇'
       end
       ------------
       if database:get("lock_inline:tshake"..msg.chat_id_..bot_id) then
       mute_in = '✔┇'
       else
       mute_in = '✖┇'
       end
       ------------
       if database:get("lock_voice:tshake"..msg.chat_id_..bot_id) then
       mute_voice = '✔┇'
       else
       mute_voice = '✖┇'
       end
       ------------
       if database:get("lock_edit:tshake"..msg.chat_id_..bot_id) then
       mute_edit = '✔┇'
       else
       mute_edit = '✖┇'
       end
   ------------
       if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
       mute_links = '✔┇'
       else
       mute_links = '✖┇'
       end
   ------------
       if database:get("lock_pin:tshake"..msg.chat_id_..bot_id) then
       lock_pin = '✔┇'
       else
       lock_pin = '✖┇'
     end

       if database:get("lock_files:tshake"..msg.chat_id_..bot_id) then
       mute_doc = '✔┇'
       else
       mute_doc = '✖┇'
     end

       if database:get("lock_mark:tshake"..msg.chat_id_..bot_id) then
       mute_mdd = '✔┇'
       else
       mute_mdd = '✖┇'
       end
   ------------
       if database:get("lock_stecker:tshake"..msg.chat_id_..bot_id) then
       lock_sticker = '✔┇'
       else
       lock_sticker = '✖┇'
       end
       ------------
   if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
       lock_tgservice = '✔┇'
       else
       lock_tgservice = '✖┇'
       end
       ------------
   if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
       lock_htag = '✔┇'
       else
       lock_htag = '✖┇'
     end

  if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
       lock_cmd = '✔┇'
       else
       lock_cmd = '✖┇'
       end
       ------------
   if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
       lock_tag = '✔┇'
       else
       lock_tag = '✖┇'
       end
       ------------
  if database:get("lock_contact:tshake"..msg.chat_id_..bot_id) then
       lock_contact = '✔┇'
       else
       lock_contact = '✖┇'
       end
       ------------
   if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
       lock_english = '✔┇'
       else
       lock_english = '✖┇'
       end
       ------------
   if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
       lock_arabic = '✔┇'
       else
       lock_arabic = '✖┇'
     end
       ------------
   if database:get("lock_fwd:tshake"..msg.chat_id_..bot_id) then
       lock_forward = '✔┇'
       else
       lock_forward = '✖┇'
     end

   if database:get('tshake:'..bot_id..'rep:mute'..msg.chat_id_) then
       lock_rep = '✔┇'
       else
       lock_rep = '✖┇'
       end
       ------------
   if database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
       lock_repsudo = '✔┇'
       else
       lock_repsudo = '✖┇'
       end
       ------------
   if database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
       lock_repowner = '✔┇'
       else
       lock_repowner = '✖┇'
       end
       ------------
   if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
       lock_id = '✔┇'
       else
       lock_id = '✖┇'
       end
       ------------
   if database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
       lock_pind = '✔┇'
       else
       lock_pind = '✖┇'
       end
       ------------
   if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
       lock_id_photo = '✔┇'
       else
       lock_id_photo = '✖┇'
       end
       ------------
if database:get( 'tshake:'..bot_id.."welcome"..msg.chat_id_) then
send_welcome = '✔┇'
else
send_welcome = '✖┇'
end
    ------------
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
  if ex == -1 then
  exp_dat = 'لا نهائي'
  else
  exp_dat = math.floor(ex / 86400) + 1
        end
     ------------
     local TXT = "🗑┇اعدادات المجموعه بالمسح\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇~⪼ مفعل\n✖┇~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  ..mute_all.."الميديا".."\n"
  ..mute_links.." الروابط".."\n"
  ..mute_edit .." التعديل".."\n"
  ..mute_bots .." البوتات".."\n"
  ..mute_botsb.." البوتات بالطرد".."\n"
  ..lock_english.." اللغه الانكليزيه".."\n"
  ..lock_forward.." اعاده التوجيه".."\n"
  ..lock_pin.." التثبيت".."\n"
  ..lock_arabic.." اللغه العربيه".."\n"
  ..lock_htag.." التاكات".."\n"
  ..lock_tag.." المعرفات".."\n"
  ..lock_tgservice.." الاشعارات".."\n"
  ..mute_flood.." التكرار".."\n\n"
  ..mute_text.." الدردشه".."\n"
  ..mute_gifs.." الصور المتحركه".."\n"
  ..mute_voice.." الصوتيات".."\n"
  ..mute_music.." الاغاني".."\n"
  ..mute_in.." الانلاين".."\n"
  ..lock_sticker.." الملصقات".."\n\n"
  ..lock_contact.." جهات الاتصال".."\n"
  ..mute_video.." الفيديوهات".."\n"
  ..lock_cmd.." الشارحه".."\n"
  ..mute_mdd.." الماركدون".."\n"
  ..mute_doc.." الملفات".."\n"
  ..mute_photo.." الصور".."\n"
  ..mute_note.." بصمه الفيديو".."\n"
  ..lock_repsudo.." ردود المطور".."\n\n"
  ..lock_repowner.." ردود المدير".."\n"
  ..lock_id.."الايدي".."\n"
  ..lock_pind.."خاصية التثبيت".."\n"
  ..lock_id_photo.."الايدي بالصوره".."\n"
  ..send_welcome.." الترحيب".."\n"
  .."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉  \n"
  ..'🔗┇عدد التكرار : '..flood_m..'\n'
  ..'🔗┇زمن التكرار : '..flood_m..'\n'
  ..'🔗┇انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
   send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
    end
    
  if (text and text == 'تفعيل اطردني') and is_owner(msg) then
     if not database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '☑┇امر اطردني بالفعل تم تفعيله', 1, 'md')
     else
   send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل امر اطردني', 1, 'md')
    database:del('tshake:'..bot_id..'kickme:mute'..msg.chat_id_)
   end
   end
   if (text and text == 'تعطيل اطردني') and is_owner(msg) then
     if database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '☑┇امر اطردني بالفعل تم تعطيله', 1, 'md')
   else
   send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل امر اطردني', 1, 'md')
     database:set('tshake:'..bot_id..'kickme:mute'..msg.chat_id_,true)
   end
     end

  if text:match("^اطردني$") then
  if not database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
  redis:set('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
  redis:set('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
  send(msg.chat_id_, msg.id_, 1, '🚷┇ ارسل ؛ نعم ، ليتم طردك\n🔘┇ارسل ؛ لا ، لالغاء الامر', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '⚠┇تم تعطيل امر اطردني', 1, 'md')
  end
  end
  local yess = redis:get('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'')
  if yess == 'kickyes' then
  if text:match("^نعم$") then
  if is_vip(msg) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا استطيع طرد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  local yess = redis:get('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'')
  if yess == 'kickyes' then
  chat_kick(msg.chat_id_, msg.sender_user_id_)
  redis:del('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
  redis:del('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
  send(msg.chat_id_, msg.id_, 1, '✅┇تم طردك من المجموعه', 1, 'md')
    end
    end
  end
  if text:match("^لا$") then
  local noo = redis:get('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'')
  if noo == 'kickno' then
  redis:del('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
  redis:del('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
  send(msg.chat_id_, msg.id_, 1, '🔘┇تم الغاء الامر', 1, 'md')
    end
    end
  end
    
  if (text and text == 'تغير امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
  redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'msg')
    return false end
  if text:match("^(.*)$") then
  local keko2 = redis:get('tshake:'..bot_id..'texts'..msg.sender_user_id_..'')
  if keko2 == 'msg' then
  send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
  redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
  redis:set('tshake:'..bot_id..'text_sudo', text)
  send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
    return false end
   end
  if  (text and text == 'مسح امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
   redis:del('tshake:'..bot_id..'text_sudo', text)
   send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الكليشه ', 1, 'html')
    end
  if text:match("^[Dd][Ee][Vv]$")or text:match("^مطور بوت$") or text:match("^مطورين$") or text:match("^مطور البوت$") or text:match("^مطور$") or text:match("^المطور$") and msg.reply_to_message_id_ == 0 then
    local text_sudo = redis:get('tshake:'..bot_id..'text_sudo')
  local nkeko = redis:get('tshake:'..bot_id..'nmkeko')
  local nakeko = redis:get('tshake:'..bot_id..'nakeko')
    if text_sudo then
    send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md')
    else
    sendContact(msg.chat_id_, msg.id_, 0, 1, nil, (nkeko or 9647707641864), (nakeko or "TshAke TEAM"), "", bot_id)
  end
   end
    for k,v in pairs(sudo_users) do
  if text:match("^تغير امر المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال رقم المطور` 🗳', 1, 'md')
  redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'msg')
    return false end
  end
  if text:match("^+(.*)$") then
  local kekoo = redis:get('tshake:'..bot_id..'sudoo'..text..'')
  local keko2 = redis:get('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'')
  if keko2 == 'msg' then
  send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال الاسم الذي تريده` 🏷', 1, 'md')
  redis:set('tshake:'..bot_id..'nmkeko', text)
  redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'mmsg')
    return false end
  end
  if text:match("^(.*)$") then
  local keko2 = redis:get('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'')
  if keko2 == 'mmsg' then
  send(msg.chat_id_, msg.id_, 1, '• `تم حفظ الاسم يمكنك اظهار الجه بـ ارسال امر المطور` ☑', 1, 'md')
  redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'no')
  redis:set('tshake:'..bot_id..'nakeko', text)
  local nmkeko = redis:get('tshake:'..bot_id..'nmkeko')
  sendContact(msg.chat_id_, msg.id_, 0, 1, nil, nmkeko, text , "", bot_id)
    return false end
  end

    if text:match("^اضف مطور$")  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
    function promote_by_reply(extra, result, success)
    if redis:sismember('tshake:'..bot_id..'dev', result.sender_user_id_) then
	tsX000("prore",msg,'☑┇بالفعل تم رفعه مطور')
  else
    redis:set('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
    redis:sadd('tshake:'..bot_id..'dev', result.sender_user_id_)
	tsX000("prore",msg,'☑┇تم رفعه مطور')
    end
  end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
  end
    
    if text:match("^اضف مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
    local apmd = {string.match(text, "^(اضف مطور) @(.*)$")}
    function promote_by_username(extra, result, success)
    if result.id_ then
    redis:set('tshake:'..bot_id..'sudoo'..result.id_..'', 'yes')
    redis:sadd('tshake:'..bot_id..'dev', result.id_)
      texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n\n☑┇تم رفعه مطور'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apmd[2],promote_by_username)
  end
    
    if text:match("^اضف مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
    local apmd = {string.match(text, "^(اضف مطور) (%d+)$")}
    redis:set('tshake:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
    redis:sadd('tshake:'..bot_id..'dev', apmd[2])
	tsX000(apmd[2],msg,'☑┇تم رفعه مطور')
  end
    
    if text:match("^حذف مطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
    function demote_by_reply(extra, result, success)
    if not redis:sismember('tshake:'..bot_id..'dev', result.sender_user_id_) then
	tsX000("prore",msg,'☑┇ بالفعل تم تنزيله من المطورين')
    else
    redis:del('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
    redis:srem('tshake:'..bot_id..'dev', result.sender_user_id_)
	tsX000("prore",msg,'☑┇ تم تنزيله من مطورين البوت')
    end
    end
    getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
  end
    
    if text:match("^حذف مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
    local apmd = {string.match(text, "^(حذف مطور) @(.*)$")}
    function demote_by_username(extra, result, success)
    if result.id_ then
    redis:del('tshake:'..bot_id..'sudoo'..result.id_..'', 'no')
    redis:srem('tshake:'..bot_id..'dev', result.id_)
     texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'tshaketeam')..')\n☑┇ تم تنزيله من مطورين البوت'
  else
    texts = '✖┇خطاء'
  end
       send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
    resolve_username(apmd[2],demote_by_username)
  end
    
    if text:match("^حذف مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
    local apmd = {string.match(text, "^(حذف مطور) (%d+)$")}
    redis:del('tshake:'..bot_id..'sudoo'..apmd[2]..'', 'no')
    redis:srem('tshake:'..bot_id..'dev', apmd[2])
	tsX000(apmd[2],msg,'☑┇ تم تنزيله من مطورين البوت')
    end
    if text:match("^اضف رد$") and is_owner(msg) then
  send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد اضافتها', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
    return false end
  if text:match("^(.*)$") then
  if not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
  local keko = redis:get('tshake:'..bot_id..'keko'..text..''..msg.chat_id_..'')
  send(msg.chat_id_, msg.id_, 1, keko, 1, 'md')
  end
  local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
  if keko1 == 'msg' then
  send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
  redis:set('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
  redis:sadd('tshake:'..bot_id..'repowner'..msg.sender_user_id_..''..msg.chat_id_..'', text)
    return false end
  if keko1 == 're' then
  local keko2 = redis:get('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'')
  redis:set('tshake:'..bot_id..'keko'..keko2..''..msg.chat_id_..'', text)
  redis:sadd('tshake:'..bot_id..'kekore'..msg.chat_id_..'', keko2)
  send(msg.chat_id_, msg.id_, 1, "☑┇تم حفظ الرد", 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
  end
  end
    if text:match("^حذف رد$") and is_owner(msg) then
  send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد حذفها', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
    return false end
  if text:match("^(.*)$") then
  local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
  if keko1 == 'nomsg' then
  send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
  redis:set('tshake:'..bot_id..'keko'..text..''..msg.chat_id_..'', " ")
 redis:srem('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
   end
  end
    if text:match("^اضف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
  send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد اضافته', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'msg')
    return false end
  if text:match("^(.*)$") then
  if not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
  local keko = redis:get('tshake:'..bot_id..'keko'..text..'')
  send(msg.chat_id_, msg.id_, 1, keko, 1, 'md')
  end
  local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'')
  if keko1 == 'msg' then
  send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 're')
  redis:set('tshake:'..bot_id..'msg'..msg.sender_user_id_..'', text)
    return false end
  if keko1 == 're' then
  local keko2 = redis:get('tshake:'..bot_id..'msg'..msg.sender_user_id_..'')
  redis:set('tshake:'..bot_id..'keko'..keko2..'', text)
  redis:sadd('tshake:'..bot_id..'kekoresudo', keko2)
  send(msg.chat_id_, msg.id_, 1, "☑┇تم حفظ الرد", 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'no')
  end
  end

  if text:match("^حذف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
  send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد حذفها' , 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'nomsg')
    return false end
  if text:match("^(.*)$") then
  local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'')
  if keko1 == 'nomsg' then
  send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
  redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..'', 'no')
   redis:set('tshake:'..bot_id..'keko'..text..'', " ")
   redis:srem('tshake:'..bot_id..'kekoresudo', text)
   end
  end

  if text:match("^مسح المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
    local list = redis:smembers('tshake:'..bot_id..'dev')
    for k,v in pairs(list) do
  redis:del('tshake:'..bot_id..'dev', text)
  redis:del('tshake:'..bot_id..'sudoo'..v..'', 'no')
  end
    send(msg.chat_id_, msg.id_, 1, "☑┇تم مسح مطورين البوت", 1, 'md')
    end
    if text:match("^مسح ردود المدير$") and is_owner(msg) then
    local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
    for k,v in pairs(list) do
  redis:del('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
  redis:set('tshake:'..bot_id..'keko'..v..''..msg.chat_id_..'', " ")
  end
    send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير` 🗑", 1, 'md')
    end
    if text:match("^مسح ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
    local list = redis:smembers('tshake:'..bot_id..'kekoresudo')
    for k,v in pairs(list) do
  redis:del('tshake:'..bot_id..'kekoresudo', text)
  redis:set('tshake:'..bot_id..'keko'..v..'', " ")
  end
    send(msg.chat_id_, msg.id_, 1, "☑┇تم مسح ردود المطور", 1, 'md')
    end

  if text:match("^المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
       local list = redis:smembers('tshake:'..bot_id..'dev')
       text = "⛔┇قائمه المطورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
       for k,v in pairs(list) do
       local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
     if user_info and user_info.username then
     local username = user_info.username
     text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
     else
     text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
     end
     if #text > 7000 then
     send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
     text = ""
     end
       end
       if #list == 0 then
     text = "✖┇لايوجد مطورين"
     end
       send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
     end
  ------------------------------------
  if text:match("^ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
    local list = redis:smembers('tshake:'..bot_id..'kekoresudo')
    text = "📑┇قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
  text = text.."<b>|"..k.."|</b>~⪼("..v..")\n"
     if #text > 7000 then
     send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
     text = ""
     end
    end
    if #list == 0 then
  text = "❕┇لا يوجد ردود للمطور"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
    if text:match("^ردود المدير$") and is_owner(msg) then
    local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
    text = "📑┇قائمه ردود المدير\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
    text = text.."<b>|"..k.."|</b>~⪼("..v..")\n"
     if #text > 7000 then
     send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
     text = ""
     end
    end
    if #list == 0 then
  text = "❕┇لا يوجد ردود للمدير"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
    
      if text:match("^كرر (.*)$") and is_mod(msg) then
    local txt = {string.match(text, "^(كرر) (.*)$")}
     send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
  end
    
      if text:match("^وضع قوانين (.*)$") and is_mod(msg) then
    local txt = {string.match(text, "^(وضع قوانين) (.*)$")}
    database:set('tshake:'..bot_id..'rules'..msg.chat_id_, txt[2])
     send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع القوانين للمجموعه", 1, 'md')
    end
    
      if  text:match("^القوانين$") then
    local rules = database:get('tshake:'..bot_id..'rules'..msg.chat_id_)
    if rules then
     send(msg.chat_id_, msg.id_, 1, '⚜┇قوانين المجموعه هي\n'..rules, 1, 'md')
  else
     send(msg.chat_id_, msg.id_, 1, '⚜┇لم يتم حفظ قوانين للمجموعه', 1, 'md')
    end
    end
    
      if text:match("^وضع اسم (.*)$") and is_mod(msg)  then
    local txt = {string.match(text, "^(وضع اسم) (.*)$")}
    changetitle(msg.chat_id_, txt[2])
     send(msg.chat_id_, msg.id_, 1, '✔┇تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
  end
    

    if text:match("^وضع صوره") and is_mod(msg) then
  database:set('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
     send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال صوره الان', 1, 'md')
  end

    if  text:match("^مسح الصوره") and is_mod(msg) then
  https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
     send(msg.chat_id_, msg.id_, 1, '🗑┇تم مسح الصوره', 1, 'md')
  end

         if text:match("^وضع وصف (.*)$") and is_mod(msg) then
         local text = {string.match(text, "^(وضع وصف) (.*)$")}
               bot.changeChannelAbout(msg.chat_id_,text[2])
                    send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع وصف للمجموعه", 1, 'md')
end
    
    if  text:match("^الوقت$") and is_mod(msg) then
  local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
   if ex == -1 then
      send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي` ☑', 1, 'md')
   else
    local d = math.floor(ex / day ) + 1
  send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
   end
  end
    
  if text:match("^مسح$") and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then
  delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
  delete_msg(msg.chat_id_, {[0] = msg.id_})
  end
    ----------------------------------------------------------------------------------------------
     if text:match('^تنظيف (%d+)$') and is_owner(msg) then
    local matches = {string.match(text, "^(تنظيف) (%d+)$")}
     if msg.chat_id_:match("^-100") then
  if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
  pm = '❕┇لا تستطيع حذف اكثر من 100 رساله'
  send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
    else
  tdcli_function ({
  ID = "GetChatHistory",
   chat_id_ = msg.chat_id_,
  from_message_id_ = 0,
     offset_ = 0,
  limit_ = tonumber(matches[2])}, delmsg, nil)
  pm ='☑┇تم <b>{'..matches[2]..'}</b> من الرسائل\n🗑┇حذفها'
  send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
   end
    else pm ='❕┇هناك خطاء'
  send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
    end
  end
  ----------------------------------------------------------------------------------------------
 
  if (text and text == 'تفعيل الايدي بالصوره') and is_owner(msg) then
  if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '☑┇الايدي بالصوره بالفعل تم تفعيله', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل الايدي بالصوره', 1, 'md')
     database:del('tshake:'..bot_id..'id:photo'..msg.chat_id_)
  end
  end
  if (text and text == 'تعطيل الايدي بالصوره') and is_owner(msg) then
  if database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '☑┇الايدي بالصوره بالفعل تم تعطيله', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل الايدي بالصوره', 1, 'md')
  database:set('tshake:'..bot_id..'id:photo'..msg.chat_id_,true)
  end
  end
if (text and text == 'تفعيل جلب صوره') and is_owner(msg) then
  if not database:get('tshake:'..bot_id..'get:photo'..msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '☑┇جلب صوره بالفعل تم تفعيله', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل جلب صوره', 1, 'md')
     database:del('tshake:'..bot_id..'get:photo'..msg.chat_id_)
  end
  end
  if (text and text == 'تعطيل جلب صوره') and is_owner(msg) then
  if database:get('tshake:'..bot_id..'get:photo'..msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '☑┇جلب صوره بالفعل تم تعطيله', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل جلب صوره', 1, 'md')
  database:set('tshake:'..bot_id..'get:photo'..msg.chat_id_,true)
  end
  end
  if  (text and text == 'تفعيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if database:sismember('tshake:'..bot_id..'pro:groups',msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '☑┇بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
     database:sadd('tshake:'..bot_id..'pro:groups',msg.chat_id_)
  end
  end
  if   (text and text == 'تعطيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if not database:sismember('tshake:'..bot_id..'pro:groups',msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '☑┇بالفعل تم حذف المجموعه من الوضع المدفوع', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف المجموعه من الوضع المدفوع', 1, 'md')
  database:srem('tshake:'..bot_id..'pro:groups',msg.chat_id_)
  end
  end
  if  (text and text == 'تفعيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if not database:get('tshake:'..bot_id..'bc:groups') then
    send(msg.chat_id_, msg.id_, 1, '☑┇الاذاعه بالفعل تم تفعيلها', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل اذاعه البوت', 1, 'md')
     database:del('tshake:'..bot_id..'bc:groups')
  end
  end
  if   (text and text == 'تعطيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if database:get('tshake:'..bot_id..'bc:groups') then
    send(msg.chat_id_, msg.id_, 1, '☑┇الاذاعه بالفعل تم تعطيلها', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل اذاعه البوت', 1, 'md')
  database:set('tshake:'..bot_id..'bc:groups',true)
  end
  end
  if   (text and text == 'تفعيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if not database:get('tshake:'..bot_id..'leave:groups') then
    send(msg.chat_id_, msg.id_, 1, '☑┇مغادره بالفعل تم تفعيلها', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل مغادره البوت', 1, 'md')
     database:del('tshake:'..bot_id..'leave:groups'..msg.chat_id_)
  end
  end
  if (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if database:get('tshake:'..bot_id..'leave:groups') then
    send(msg.chat_id_, msg.id_, 1, '☑┇مغادره بالفعل تم تعطيلها', 1, 'md')
  else
    send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل مغادره البوت', 1, 'md')
  database:set('tshake:'..bot_id..'leave:groups'..msg.chat_id_,true)
  end
  end
    
  if  (text and text == 'تفعيل ردود المطور') and is_owner(msg) then
    if not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ردود المطور بالفعل تم تفعيلها', 1, 'md')
    else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل ردود المطور', 1, 'md')
   database:del('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_)
  end
  end
  if  (text and text == 'تعطيل ردود المطور') and is_owner(msg) then
    if database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ردود المطور بالفعل تم تعطيلها', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, 'تم تعطيل ردود المطور', 1, 'md')
    database:set('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_,true)
  end
    end
  if (text and text == 'تفعيل ردود المدير') and is_owner(msg) then
    if not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ردود المدير بالفعل تم تفعيلها', 1, 'md')
    else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل ردود المدير', 1, 'md')
   database:del('tshake:'..bot_id..'repowner:mute'..msg.chat_id_)
  end
  end
  if  (text and text == 'تعطيل ردود المدير') and is_owner(msg) then
    if database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ردود المدير بالفعل تم تعطيلها', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل ردود المدير', 1, 'md')
    database:set('tshake:'..bot_id..'repowner:mute'..msg.chat_id_,true)
  end
    end
    
     if  text:match("^ايدي المجموعه$") then
  send(msg.chat_id_, msg.id_, 1, "*"..msg.chat_id_.."*", 1, 'md')
    end
    
  if  (text and text == 'تفعيل الايدي') and is_owner(msg) then
    if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇الايدي بالفعل تم تفعيله', 1, 'md')
    else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل الايدي', 1, 'md')
   database:del('tshake:'..bot_id..'id:mute'..msg.chat_id_)
  end
  end
  if  (text and text == 'تعطيل الايدي') and is_owner(msg) then
    if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇الايدي بالفعل تم تعطيله', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل الايدي', 1, 'md')
    database:set('tshake:'..bot_id..'id:mute'..msg.chat_id_,true)
  end
  end
  if text and text == "تعين مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ تم تعين ~⪼ `'..msg.chat_id_..'`', 1, 'md')
  database:set("tshake"..bot_id..":sudo:gr",msg.chat_id_)
  end
  if text and text == "مسح مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ تم مسح مجموعه المطور', 1, 'md')
  database:del("tshake"..bot_id..":sudo:gr")
  end
  if text:match("^ايدي$") and msg.reply_to_message_id_ == 0 then
  local keko_info = nil
  function keko333(extra,result,success)
  keko_info = '@'..(result.username_ or 'لا يوجد')..''
  local function getpro(extra, result, success)
  local user_msgs = database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
  local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
  if result.photos_[0] then
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
  if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
  if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
  local keko_text = {
 ' ياحلو مين الله جابك🤧',
  " غير صورتك 😪 ",
  " تخليني♥️ ",
  " طالع حلو ^_^ ",
  " ليش مغير صورتك 🤣 ",
  " منور 😚",
}
keko3 = math.random(#keko_text)
  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," 📷┇ "..keko_text[keko3].."\n🎫┇ايديك ~⪼ ("..msg.sender_user_id_..")\n📜┇معرفك ~⪼ "..keko_info.."\n📡┇موقعك ~⪼ "..t.."\n📨┇رسائلك ~⪼ {"..user_msgs.."}\n📧┇السحكات ~⪼ {"..edit.."}\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ",msg.id_,msg.id_.."")
  else 
  local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
  local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))
  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,tshake_new_text,msg.id_,msg.id_.."")
  end
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
  send(msg.chat_id_, msg.id_, 1, "🎫┇ايديك ~⪼ ("..msg.sender_user_id_..")\n📜┇معرفك ~⪼ "..keko_info.."\n📡┇موقعك ~⪼ "..t.."\n📨┇رسائلك ~⪼ <b>{"..user_msgs.."}</b>\n📧┇السحكات ~⪼ <b>{"..edit.."}</b>\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉", 1, 'html')
  else 
  local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
  local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))   
  send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
  end   
  end
  else
  end
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
  if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
  if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
  send(msg.chat_id_, msg.id_, 1, "❕┇انت لا تملك صوره لحسابك\n🎫┇ايديك ~⪼ ("..msg.sender_user_id_..")\n📜┇معرفك ~⪼ "..keko_info.."\n📡┇موقعك ~⪼ "..t.."\n📨┇رسائلك ~⪼ <b>{"..user_msgs.."}</b>\n📧┇السحكات ~⪼ <b>{"..edit.."}</b>\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
  else 
  local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
  local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))   
  send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
  end
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
  send(msg.chat_id_, msg.id_, 1, "🎫┇ايديك ~⪼ ("..msg.sender_user_id_..")\n📜┇معرفك ~⪼ "..keko_info.."\n📡┇موقعك ~⪼ "..t.."\n📨┇رسائلك ~⪼ <b>{"..user_msgs.."}</b>\n📧┇السحكات ~⪼ <b>{"..edit.."}</b>\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉", 1, 'html')
  else 
  local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
  local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))   
  send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')  
  end 
  end
  else
  end
     end
     end
     tdcli_function ({
  ID = "GetUserProfilePhotos",
  user_id_ = msg.sender_user_id_,
  offset_ = 0,
  limit_ = 1
    }, getpro, nil)
  end
  getUser(msg.sender_user_id_, keko333)
  end
     if text:match('^الحساب (%d+)$') then
    local id = text:match('^الحساب (%d+)$')
    local text = 'اضغط لمشاهده الحساب'
  tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
     end
	 local function oChat(chat_id,cb)
  tdcli_function ({
    ID = "OpenChat",
    chat_id_ = chat_id
  }, cb, nil)
end
  if text:match("^معلومات (.*)$") then
  local memb = {string.match(text, "^(معلومات) (.*)$")}
  function whois(extra,result,success)
  if result.username_ then
   result.username_ = '@'..result.username_
     else
   result.username_ = 'لا يوجد معرف'
     end
  send(msg.chat_id_, msg.id_, 1, '📜┇معرف ~⪼ ('..result.username_..')\n🔘┇الاسم ~⪼ ('..result.first_name_..')', 1, 'md')
  end
  getUser(memb[2],whois)
  end

  if  (text and text == 'تفعيل التثبيت') and is_owner(msg) then
     if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '☑┇التثبيت بالفعل تم تفعيله', 1, 'md')
     else
   send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل التثبيت', 1, 'md')
    database:del('tshake:'..bot_id..'pin:mute'..msg.chat_id_)
   end
   end
   if  (text and text == 'تعطيل التثبيت') and is_owner(msg) then
     if database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '☑┇التثبيت بالفعل تم تعطيله', 1, 'md')
   else
   send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل التثبيت', 1, 'md')
     database:set('tshake:'..bot_id..'pin:mute'..msg.chat_id_,true)
   end
     end

     if text:match("^تثبيت$") and is_mod(msg) and not is_owner(msg) then
    local id = msg.id_
    local msgs = {[0] = id}
     if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
   pin(msg.chat_id_,msg.reply_to_message_id_,0)
       database:set('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
     send(msg.chat_id_, msg.id_, 1, '☑┇تم تثبيت الرساله',1, 'md')
  else
     send(msg.chat_id_, msg.id_, 1, '☑┇التثبيت معطل',1, 'md')
  end
  end

     if  text:match("^الغاء تثبيت$") and is_mod(msg) and not is_owner(msg) or text:match("^الغاء التثبيت") and is_mod(msg) and not is_owner(msg) then
     if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
     unpinmsg(msg.chat_id_)
     send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء تثبيت الرساله', 1, 'md')
  else
     send(msg.chat_id_, msg.id_, 1, '☑┇الغاء التثبيت معطل', 1, 'md')
  end
     end

     if  text:match("^تثبيت$") and is_owner(msg) then
    local id = msg.id_
    local msgs = {[0] = id}
    pin(msg.chat_id_,msg.reply_to_message_id_,0)
     database:set('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
     send(msg.chat_id_, msg.id_, 1, '☑┇تم تثبيت الرساله',1, 'md')
  end

     if  text:match("^الغاء تثبيت$") and is_owner(msg) or text:match("^الغاء التثبيت") and is_owner(msg) then
     unpinmsg(msg.chat_id_)
     send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء تثبيت الرساله', 1, 'md')
     end

     if  text:match("^مشاهده منشور$") then
    database:set('tshake:'..bot_id..'viewget'..msg.sender_user_id_,true)
    send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال المنشور الان ',1, 'md')
     end
  if (text and text == 'استعاده الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  redis:del('tshake:'..bot_id..'help', text)
  redis:del('tshake:'..bot_id..'h1', text)
  redis:del('tshake:'..bot_id..'h2', text)
  redis:del('tshake:'..bot_id..'h3', text)
  redis:del('tshake:'..bot_id..'h4', text)
  redis:del('tshake:'..bot_id..'h5', text)
  redis:del('tshake:'..bot_id..'h6', text)
   send(msg.chat_id_, msg.id_, 1, '☑┇تم استعاده جميع كلايش الاوامر', 1, 'html')
    end
  if (text and text == 'تغير امر الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
  redis:set('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'', 'msg')
    return false end
  if text:match("^(.*)$") then
  local keko2 = redis:get('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'')
  if keko2 == 'msg' then
  send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
  redis:set('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'', 'no')
  redis:set('tshake:'..bot_id..'help', text)
  send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
    return false end
   end

     if text:match("^الاوامر$") and is_mod(msg) then
  local help = redis:get('tshake:'..bot_id..'help')
     local text =  [[📮┇هناك {4} اوامر لعرضها
 ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗑┇م1 ~⪼ لعرض اوامر الحمايه

📚┇ م2 ~⪼ لعرض اوامر الادمنيه

🗓┇م3 ~⪼ لعرض اوامر المدراء

🎖┇م4 ~⪼ لعرض اوامر المطورين
 ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉]]
  send(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
     end

  if (text and text == 'تغير امر م1') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
  redis:set('tshake:'..bot_id..'h11'..msg.sender_user_id_..'', 'msg')
    return false end
  if text:match("^(.*)$") then
  local keko2 = redis:get('tshake:'..bot_id..'h11'..msg.sender_user_id_..'')
  if keko2 == 'msg' then
  send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
  redis:set('tshake:'..bot_id..'h11'..msg.sender_user_id_..'', 'no')
  redis:set('tshake:'..bot_id..'h1', text)
  send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
    return false end
   end
     if text:match("^م1$") and is_mod(msg) then
  local h1 = redis:get('tshake:'..bot_id..'h1')
     local text =  [[
📮┇ اوامر حمايه المجموعه بالمسح
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔒┇قفل ~⪼ لقفل امر
  🔓┇فتح ~⪼ لفتح امر
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔐┇الروابط
  🔐┇المعرف
  🔐┇التاك
  🔐┇الشارحه
  🔐┇التعديل
  🔐┇التثبيت
  🔐┇المتحركه
  🔐┇الملفات
  🔐┇الصور

  🔐┇الملصقات
  🔐┇الفيديو
  🔐┇الانلاين
  🔐┇الدردشه
  🔐┇التوجيه
  🔐┇الاغاني
  🔐┇الصوت
  🔐┇الجهات
  🔐┇الاشعارات
  🔐┇الماركدون

  🔐┇البوتات
  🔐┇العربيه
  🔐┇الانكليزية
  🔐┇الميديا
  🔐┇التكرار
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📡┇Ch ~⪼ @MEXIC_TV]]
  send(msg.chat_id_, msg.id_, 1, (h1 or text), 1, 'md')
     end
  if (text and text == 'تغير امر م2') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
   send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
   redis:set('tshake:'..bot_id..'h22'..msg.sender_user_id_..'', 'msg')
     return false end
   if text:match("^(.*)$") then
   local keko2 = redis:get('tshake:'..bot_id..'h22'..msg.sender_user_id_..'')
   if keko2 == 'msg' then
   send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
   redis:set('tshake:'..bot_id..'h22'..msg.sender_user_id_..'', 'no')
   redis:set('tshake:'..bot_id..'h2', text)
   send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
     return false end
    end
     if text:match("^م2$") and is_mod(msg) then
   local h2 = redis:get('tshake:'..bot_id..'h2')
     local text =  [[	🥈┇اوامر الادمنيه
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🚫┇كتم
  🚫┇حظر
  🚫┇طرد
  🚫┇المحظورين  
  🚹┇الغاء حظر
  🚹┇الغاء كتم
  🚹┇تثبيت
  🚹┇الغاء تثبيت
  🚹┇الاعدادات

  📜┇المكتومين
  📜┇قائمه المنع
  📜┇الرابط
  📜┇القوانين
  📜┇منع + الكلمه
  📜┇الغاء منع + الكلمه
  📜┇الوقت
  📜┇حذف الترحيب
  📜┇وضع ترحيب
  📜┇تفعيل الترحيب
  📜┇تعطيل الترحيب
  📜┇جلب الترحيب

  📜┇معلومات + ايدي
  📜┇الحساب + ايدي
  📜┇كرر + الكلمه
 
📜┇ايدي
📜┇جهاتي
📜┇عدد السحكات
📜┇رسائلي			
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔘┇وضع + الاوامر الادناه
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📝┇رابط
  📝┇اسم
  📝┇صوره
  📝┇وصف
  📝┇قوانين
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🗑┇مسح + الاوامر الادناه
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📮┇قائمه المنع
  📮┇الرابط
  📮┇المحظورين
  📮┇البوتات
  📮┇المكتومين
  📮┇القوانين
  📮┇الصوره
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📡┇Ch ~⪼ @MEXIC_TV	
							]]
  send(msg.chat_id_, msg.id_, 1, (h2 or text), 1, 'md')
     end
  if (text and text == 'تغير امر م3') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
   send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
   redis:set('tshake:'..bot_id..'h33'..msg.sender_user_id_..'', 'msg')
     return false end
   if text:match("^(.*)$") then
   local keko2 = redis:get('tshake:'..bot_id..'h33'..msg.sender_user_id_..'')
   if keko2 == 'msg' then
   send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
   redis:set('tshake:'..bot_id..'h33'..msg.sender_user_id_..'', 'no')
   redis:set('tshake:'..bot_id..'h3', text)
   send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
     return false end
    end
  if text:match("^م3$") and is_mod(msg) then
  local h4 = redis:get('tshake:'..bot_id..'h3')
  local text =  [[🥇┇ اوامر المدراء
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔘┇وضع :- مع الاوامر ادناه  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📝┇تكرار + العدد
  📝┇زمن التكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔼┇رفع ادمن
  🔽┇تنزيل ادمن
  🔼┇رفع عضو مميز
  🔽┇تنزيل عضو مميز

  ✔️┇تفعيل الايدي بالصوره
  ✖️┇تعطيل الايدي بالصوره
  ✔️┇تفعيل الايدي
  ✖️┇تعطيل الايدي
  ✔️┇تفعيل ردود المطور
  ✖️┇تعطيل ردود المطور
  ✔️┇تفعيل ردود المدير
  ✖️┇تعطيل ردود المدير
  ✔️┇تفعيل التثبيت
  ✖️┇تعطيل التثبيت
  ✔️┇تفعيل اطردني
  ✖️┇تعطيل اطردني
  ✔️┇تنظيف + عدد

  🖇┇اضف رد
  🖇┇ردود المدير
  🖇┇ادمنيه المجموعه
  🖇┇رفع الادمنيه
  🖇┇الادمنيه
  🖇┇الاعضاء المميزين

  🗑┇مسح الادمنيه
  🗑┇مسح ردود المدير
  🗑┇حذف رد
  🗑┇تنظيف قائمه المحظورين
  🗑┇مسح الادمنيه
  🗑┇مسح الاعضاء المميزين
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🏅┇اوامر المنشئين
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔼┇رفع مدير
  🔽┇تنزيل مدير
  🚫┇طرد المحذوفين
  🚫┇طرد المتروكين
  🖇┇المدراء
  🗑┇مسح المدراء
  🗑┇تنظيف قائمه المحظورين
  🔘┇تعين الايدي
  🔘┇مسح الايدي
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ]]
  send(msg.chat_id_, msg.id_, 1, (h3 or text), 1, 'md')
     end
  if (text and text == 'تغير امر م4') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
    send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
    redis:set('tshake:'..bot_id..'h44'..msg.sender_user_id_..'', 'msg')
  return false end
    if text:match("^(.*)$") then
    local keko2 = redis:get('tshake:'..bot_id..'h44'..msg.sender_user_id_..'')
    if keko2 == 'msg' then
    send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
    redis:set('tshake:'..bot_id..'h44'..msg.sender_user_id_..'', 'no')
    redis:set('tshake:'..bot_id..'h4', text)
    send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
  return
   false
 end
     end
     if text:match("^م4$") and is_mod(msg) then
  local h4 = redis:get('tshake:'..bot_id..'h4')
  local text =  [[🎖┇اوامر المطور
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  ✔️┇تفعيل
  ✖️┇تعطيل
  ✔️┇تفعيل المغادره
  ✖️┇تعطيل المغادره
  ✔️┇تفعيل الاذاعه
  ✖️┇تعطيل الاذاعه
  ✔️┇تفعيل التفعيل التلقائي
  ✖️┇تعطيل التفعيل التلقائي

  🔘┇مغادره + id
  🔘┇مغادره
  🔘┇وضع وقت + عدد
  🔘┇المده1 + id
  🔘┇المده2 + id
  🔘┇المده3 + id
  🔘┇وقت المجموعه + id
  🔘┇ردود المطور
  🔘┇تغير امر المطور
  🔘┇تغير امر المطور بالكليشه
  🔘┇مسح امر المطور بالكليشه
  🔘┇تعين مجموعه المطور
  🔘┇مسح مجموعه المطور
  🔘┇عدد الكروبات / الاحصائيات
  🔘┇روابط الكروبات
  🔘┇اضف رد للكل
  🔘┇تحديث

  🔆┇قائمه العام
  🔆┇المكتومين عام
  🔆┇المدراء
  🔆┇المنشئين
  🔆┇رفع مدير
  🔆┇تنزيل مدير
  🔆┇رفع منشئ
  🔆┇تنزيل منشئ
  🔆┇حظر عام
  🔆┇الغاء العام

  🛄┇كتم عام
  🛄┇الغاء كتم العام
  🛄┇عدد الكروبات
  🛄┇روابط الكروبات
  🛄┇اذاعه + كليشه
  🛄┇ارسال + كليشه (للاساسي)
  🛄┇اضف مطور
  🛄┇حذف مطور
  🛄┇المطورين
  🛄┇مشاهده منشور

  🗑┇حذف رد للكل
  🗑┇استعاده الاوامر
  🗑┇مسح ردود المطور
  🗑┇مسح المطورين
  🗑┇مسح قائمه العام
  🗑┇مسح المدراء
  🗑┇مسح المنشئين
  🗑┇مسح المكتومين عام

  🏷┇تغير امر الاوامر
  🏷┇تغير امر م1
  🏷┇تغير امر م2
  🏷┇تغير امر م3
  🏷┇تغير امر م4

  🗂┇الملفات
  🗂┇تفعيل ملف + اسم الملف
  🗂┇تعطيل ملف + اسم الملف
  🗂┇اضف ملف
  🗂┇مسح جميع الملفات
  🗂┇حذف ملف + اسم الملف
  🗂┇جلب ملف + اسم الملف

  🗯┇تغير نص الانلاين + النص
  🗯┇تغير رابط الانلاين + الرابط
  🗯┇تفعيل الانلاين
  🗯┇تعطيل الانلاين
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📡┇Ch ~⪼ @MEXIC_TV]]
  send(msg.chat_id_, msg.id_, 1, (h4 or text), 1, 'html')
     end
  if text:match("^اصدار$") or text:match("^الاصدار$") or text:match("^السورس$") or text:match("^سورس$") then
  local text =  [[
  👋┇اهلا بك في سورس مكسيكو 
    
  🌐┇<strong>MEXICO TEAM</strong>
    
  🦁┇<a href="https://telegram.me/EXIC_TV">قناه السورس</a>
  📜┇<a href="https://telegram.me/MEXIC_TV">قناه شروحات سورس</a>
  📁┇<a href="https://telegram.me/MEXIC_TV">قناه ملفات السورس</a>
    
  🔎┇<a href="https://t.me/ZAHAYMR/227">طريقه التنصيب</a>
    
  📮┇<a href="t.me/ZAHAYMR">لـ تواصل </a> 
  ]]
  send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end

  if text:match("^اريد رابط حذف$") or text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^الرابط حذف$") or text:match("^اريد رابط الحذف$") then
  local text =  [[
  🗑┇رابط حذف التلي ، ⬇
  ‼┇احذف ولا ترجع عيش حياتك'
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔎┇<a href="https://telegram.org/deactivate">اضغط هنا للحذف الحساب" </a>
  ]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
end

function tdcli_update_callback(data)
local chat = {}

if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local Data_Tshake = data
--         »»                 Run TshAkE                         ««              --
if database:get('tshake:'..bot_id.."charge:"..msg.chat_id_) then
if (not is_mod(msg) and not is_vip(msg)) then 
print("»» is member "..msg.sender_user_id_) 
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "tshake"
end
TSCheckMsg(msg) 
end
if is_mod(msg) then TSlocks(msg) print("\27[1;34m»» is mod "..msg.sender_user_id_.."\27[m") end
TSall(msg,data)
function check_username(extra,result,success)
local username = (result.username_ or '')
local svuser = 'tshake:'..bot_id..'user:'..result.id_
if username then
database:hset(svuser, 'username', username)
end
end
getUser(msg.sender_user_id_,check_username)
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatJoinByLink" then
function get_welcome(extra,result,success)
if database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_) then
text = database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_)
else
text = '👋🏻┇اهلا بك يا ؛ {fr}\n🙋🏼‍♂️┇نورت الكروب ؛ @{us}'
end
local text = text:gsub('{fr}',(result.first_name_ or 'لا يوجد'))
local text = text:gsub('{ls}',(result.last_name_ or 'لا يوجد'))
local text = text:gsub('{us}',(result.username_ or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if database:get('tshake:'..bot_id.."welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end end
if msg.content_.ID == "MessagePinMessage" then
if database:get('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_) and database:get("lock_pin:tshake"..msg.chat_id_..bot_id) then
local pin_id = database:get('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_)
pin(msg.chat_id_,pin_id,0)
end
end
if msg.content_.document_ then
local infooo = database:get("addfiel"..msg.sender_user_id_)
if (infooo and infooo == "yes") then
send(msg.chat_id_, msg.id_, 1, "📤┇جاري الرفع ..", 1, 'html')
local id_keko = msg.content_.document_.document_.persistent_id_
function download_to_file(url, file_path)
local respbody = {}
local options = {
url = url,
sink = ltn12.sink.table(respbody),
redirect = true
}
local response = nil
options.redirect = false
response = {https.request(options)}
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then return false, code end
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path, code
end
local url_keko3 = 'https://api.telegram.org/bot' .. token .. '/getfile?file_id='..id_keko
local keko3 = https.request(url_keko3)
local keko6 = JSON.decode(keko3)
local photo_keko = download_to_file('https://api.telegram.org/file/bot'..token..'/'..keko6.result.file_path, 'files_tshake/'..msg.content_.document_.file_name_)
send(msg.chat_id_, msg.id_, 1, "✔┇تم رفع الملف بنجاح", 1, 'html')
database:del("addfiel"..msg.sender_user_id_)
end
end
end
TSadd(msg)
if is_gbanned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_gmuted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_sudo(msg) then TSsudo(msg) print("\27[1;32m»» is sudo "..msg.sender_user_id_.."\27[m") end
id = tostring(msg.chat_id_)
if id and id:match('^(%d+)') then
database:sadd('tshake:'..bot_id.."userss",msg.chat_id_)
end
tshake_run_file(Data_Tshake)
--         »»                 Start UpdateChat                         ««              --
elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
local text = (result.content_.text_ or result.content_.caption_)
local msgg = result 
database:incr('tshake:'..bot_id..'user:editmsg'..msgg.chat_id_..':'..msgg.sender_user_id_)
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("@") then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("@") then
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if database:get("lock_edit:tshake"..msg.chat_id_..bot_id) then
local id = msg.message_id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs) end end end end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--         »»                 End UpdateChat                          ««              --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
end

--[[
   __  __   ______ _  ___ ____ _  __   ___
|  \/  | / ____|\\  //   ||  | |/ / / _ \
| |\/| | /|  _|  \\//    ||  |   / | | | |
| |  | | \| |___ //\\    ||  | . \ | |_| |  
|_|  |_| \_____|//  \\  ____ |_|\_\ \___/
              CH > @MEXIC_TV
--]]
