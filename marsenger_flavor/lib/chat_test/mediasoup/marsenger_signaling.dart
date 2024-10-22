import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class MarsengerSignaling {
  late io.Socket _socket;
  void connect() {
    _socket = io.io("Server Url", <String, dynamic>{
      'transports': ['websocket'],
    });
    _socket.on('connect', (_) {
      if (kDebugMode) {
        print('Connected to the signalling server!');
      }
    });
    _socket.on("disconnect", (_) {
      if (kDebugMode) {
        print("Disconnected from the server");
      }
    });
    _socket.on("new-peer", (data) {
      // handle new peer's data joining the room
    });
    _socket.on("offer", (data) {
      // handle SDP offer
    });
    _socket.on("answer", (data) {
      // handle SDP answer
    });
    _socket.on("ice-candidate", (data) {
      // handle ice candidates
    });
    _socket.on("join-room", (data) {
      // handle while joining the room
    });
    _socket.on("end-room", (data) {
      // handle while leaving the room
    });
  }

  //For handling the request to handle routerCapabilities
  Future<Map<String, dynamic>> request(String event, [dynamic data]) {
    final completer = Completer<Map<String, dynamic>>();

    _socket.emitWithAck(event, data, ack: (response) {
      completer.complete(response);
    });
    return completer.future;
  }
}
