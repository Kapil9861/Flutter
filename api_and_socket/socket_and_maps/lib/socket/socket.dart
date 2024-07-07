import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:socket_and_maps/smallWidgets/styled_text.dart';

class MySocket extends StatefulWidget {
  const MySocket({super.key});

  @override
  State<MySocket> createState() => _MySocketState();
}

class _MySocketState extends State<MySocket> {
  final List<Map<String, Color>> messageList = [];
  TextEditingController usernameController = TextEditingController();
  Socket? socket;
  ServerSocket? serverSocket;

  void joinServer() async {
    socket = await Socket.connect("0.0.0.0", 3000);
    addMessage(
        "Client: Connected to ip:${socket!.remoteAddress.address} and ${socket!.port}",
        Colors.green);
    socket!.listen((Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      addMessage("Client: $serverResponse", Colors.green);
      setState(() {});
    }, onError: (error) {
      addMessage("Client: $error", Colors.red);
      socket!.destroy();
      setState(() {});
    }, onDone: () {
      addMessage("Client: Server left.", Colors.red);
      socket!.destroy();
      setState(() {});
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Username'),
        content: TextField(
          controller: usernameController,
          decoration: const InputDecoration(hintText: "Username"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (usernameController.text.isNotEmpty) {
                socket!.write(usernameController.text);
                Navigator.pop(context);
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void addMessage(String message, Color color) {
    Map<String, Color> map = {};
    map[message] = color;
    setState(() {
      messageList.add(map);
    });
  }

  void connect() async {
    final ip = InternetAddress.anyIPv4;
    serverSocket = await ServerSocket.bind(ip, 3000);
    addMessage("Server is running on $ip on port no 3000", Colors.green);
    setState(() {});
    serverSocket!.listen((Socket event) {
      handleConnection(event);
    });
  }

  List<Socket> clients = [];

  handleConnection(Socket client) {
    addMessage(
        "Server: Connection from ${client.remoteAddress.address}:port ${client.port}",
        Colors.green);
    setState(() {});
    clients.add(client);
    client.listen(
      (Uint8List data) {
        final message = String.fromCharCodes(data);
        for (final c in clients) {
          c.write("Server: A new client $message has joined the server");
        }
        addMessage("Server: A new client $message has joined the server",
            Colors.green);
        client.write("Server: You are logged in as: $message");
        setState(() {});
      },
      onError: (text) {
        addMessage("Server: $text", Colors.red);
        client.close();
        setState(() {});
      },
      onDone: () {
        addMessage(
            "Server: Client left", const Color.fromARGB(255, 253, 172, 49));
        client.close();
        setState(() {});
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
                const Text("Server"),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      connect();
                    },
                    child: const Text("Connect"))
              ],
            ),
          ),
          Container(
            height: 120,
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: ListView(
              children: messageList
                  .map((message) => StyledText(
                        color: message.values.first,
                        text: message.keys.first,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Client"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  joinServer();
                },
                child: const Text("Join"),
              ),
            ],
          ),
          Container(
            height: 120,
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: ListView(
              children: messageList
                  .where((message) => message.keys.first.startsWith("Client:"))
                  .map((message) => StyledText(
                        color: message.values.first,
                        text: message.keys.first,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Client"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  joinServer();
                },
                child: const Text("Join"),
              ),
            ],
          ),
          Container(
            height: 120,
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: ListView(
              children: messageList
                  .where((message) => message.keys.first.startsWith("Client:"))
                  .map((message) => StyledText(
                        color: message.values.first,
                        text: message.keys.first,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
