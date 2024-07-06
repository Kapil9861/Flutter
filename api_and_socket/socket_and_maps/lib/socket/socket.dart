import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:socket_and_maps/smallWidgets/styled_text.dart';

class MySocket extends StatefulWidget {
  const MySocket({super.key});

  @override
  State<MySocket> createState() => _MySocketState();
}

final List<Map<String, Color>> messageList = [];

class _MySocketState extends State<MySocket> {
  void joinServer(){
    
  }
  void addMessage(String message, Color color) {
    Map<String, Color> map = {};
    map[message] = color;
    messageList.add(map);
  }

  void connect() async {
    final ip = InternetAddress.anyIPv4;
    final server = await ServerSocket.bind(ip, 3000);
    addMessage("Server is running on $ip on port no 3000", Colors.green);
    server.listen((Socket event) {
      handleConnection(event);
    });
  }

  List<Socket> clients = [];

  handleConnection(Socket client) {
    client.listen(
      (Uint8List data) {
        final message = String.fromCharCodes(data);
        for (final c in clients) {
          c.write("Server: A new client $message has joined the server");
        }
        clients.add(client);
        client.write("Server: You are logged in as: $message");
      },
      onError: (text) {
        addMessage(text, Colors.red);
        client.close();
      },
      onDone: () {
        addMessage(
            "Server:Client left", const Color.fromARGB(255, 253, 172, 49));
        client.close();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket Implementation"),
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Server"),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      connect();
                    },
                    child: Text("Connect"))
              ],
            ),
          ),
          Container(
            height: 180,
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: Text("data"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Client"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Join"),
              ),
            ],
          ),
          Container(
            height: 180,
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: StyledText(color: Colors.white, text: "text"),
          )
        ],
      ),
    );
  }
}
