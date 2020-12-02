import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatSocketIO {
  final String _socketServer = "https://site.com";
  //final String _socketServer = "http://95.216.223.177:3001";

  final bool debugging = false;
  final String userId;
  final String otherId;
  final Function onMsgReceived;
  final Function onFetchMessages;
  final Function onConnect;
  final Function onTyping;
  final Function onLastSeen;
  final Function onOnline;
  final Function onError;
  final Function onMsgDeleted;
  Socket _socket;
  bool _initialized = false;
  String get _roomId => int.parse(userId) > int.parse(otherId)
      ? "${otherId}_$userId"
      : "${userId}_$otherId";

  ChatSocketIO({
    @required this.userId,
    @required this.otherId,
    @required this.onMsgReceived,
    @required this.onFetchMessages,
    @required this.onConnect,
    @required this.onTyping,
    @required this.onLastSeen,
    @required this.onOnline,
    @required this.onError,
    @required this.onMsgDeleted,
  });

  Future<void> initialize() async {
    print("Socket room id= $_roomId");
    try {
      _socket = await io(_socketServer, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        "path": "/chat",
      });

      if (_initialized) return;

      _activeListeners();
      _socket.connect();
      _initialized = true;
      print("Socket  initialized ... ${_socket.connected.toString()}");

    }catch (e){
      print("Socket On Initialization error\n ${e.toString()}...");

    }
  }
  void _activeListeners() {
    try{
      _socket.on('connect', (data) {
        print("Socket Connected to $_socketServer...");
        onConnect();
        _socket.emit("subscribe", [_roomId, userId]);
        _socket.emit('getAllMessages', [_roomId, 100, 1]);

        checkLastSeen();
      });


      _socket.on("userLastSeen", (data) {
       print("onLastSeen ${data['last_seen']}");
        onLastSeen(data['last_seen']);
      });

      _socket.on("fetchMessages", (data) {
        if (debugging) debugPrint("onFetchMessages $data", wrapWidth: 1024);
        onFetchMessages(data['oldMessages']);
      });

      _socket.on("messageReceived", (data) {
        if (debugging) debugPrint("onMsgReceived $data", wrapWidth: 1024);
        onMsgReceived(data);
      });

      _socket.on("typing", (data) {
        if (debugging) debugPrint("onTyping $data", wrapWidth: 1024);
        onTyping(data['senderId']);
      });

      _socket.on("whoIsOnline", (data) {
        if (debugging) debugPrint("onOnline $data", wrapWidth: 1024);
        onOnline(data['onlineUsers']);
        checkLastSeen();
      });

      _socket.on("messageDeleted", (data) {
        if (debugging) debugPrint("onMsgDeleted $data", wrapWidth: 1024);
        onMsgDeleted(data['message_id']);
      });

      _socket.on("error", (data) {
        print("onError ${data}");
        onError(data);
      });

      //not used when unsubscribe
      _socket.on("disconnect", (data) {
        if (debugging) debugPrint("disconnect $data", wrapWidth: 1024);
        leaveChat();
      });

    }catch (e){
      print("Socket On Activation error\n ${e.toString()}...");
    }
  }

  Future<void> sendMsg(
      msg,
      senderId,
      isImage,
      pendingMsgId,
      date,
      ) async {
    await _socket.emit('sendMessage', [
      msg,
      senderId,
      _roomId,
      isImage,
      pendingMsgId,
      date,
    ]);
  }

  Future<void> sendImg(
      image,
      fileName,
      extension,
      senderId,
      pendingMsgId,
      date,
      ) async {
    await _socket.emit('sendImage', [
      image, //imageFile
      pendingMsgId, //messageId
      extension, //extension
      senderId, //senderId
      _roomId, //roomId
      'base64', //type
      pendingMsgId, //messageId
      '', //customData
      date, //createdAt
    ]);
  }

//  Future<void> getAllMessages(data) async {
//    _socket.emit('getAllMessages', [_roomId, 100, 1]);
//    onFetchMessages(data['oldMessages']);
//  }

  Future<void> startChat() async {
    await _socket.emit('subscribe', [_roomId, userId]);
  }

  Future<void> deleteMsg(msgId) async {
    await _socket.emit('deleteMessage', [_roomId, msgId]);
  }

  Future<void> sendTyping(senderName) async {
    await _socket.emit('typing', [_roomId, userId, senderName]);
  }

  Future<void> sendSeen(msgId) async {
    await _socket.emit('messageSeen', [msgId]);
  }

  Future<void> sendAllSeen() async {
    await _socket.emit('allMyMessagesSeen', [_roomId, userId]);
  }

  Future<void> leaveChat() async {
    await _socket.emit('unsubscribe', [_roomId, userId]);
  }

  Future<void> checkLastSeen() async {
    _socket.emit('checkLastSeen', [_roomId, otherId]);
  }

  void dispose() {
    if (debugging) debugPrint("clearing ${_socket.id}");
    _initialized = false;
    _socket.disconnect();
    _socket.close();
    _socket.destroy();
  }
}
