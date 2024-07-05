import 'package:flutter/material.dart';
import 'package:socket_and_maps/google_map_page.dart';
import 'package:socket_and_maps/providers/my_provider.dart';
import 'package:socket_and_maps/my_socket.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> navigator(BuildContext context, Widget widget) async {
      try {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      } catch (e) {
        print(e);
      }
    }

    return MaterialApp(
      home: SafeArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text("Socket, Google Map and Provider"),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigator(context, const GoogleMapPage());
                    },
                    child: const Text("Google Map Example"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigator(context, const MyProvider());
                    },
                    child: const Text("Provider Example"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigator(context, const MySocket());
                    },
                    child: const Text("Socket"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
