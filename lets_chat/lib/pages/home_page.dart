import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/models/users_profile.dart';
import 'package:lets_chat/services/alert_service.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/services/database_service.dart';
import 'package:lets_chat/services/navigation_service.dart';
import 'package:lets_chat/widgets/chat_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  late NavigationService _navigationService;
  late DatabaseService _databaseService;
  late AlertService _alerService;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _databaseService = _getIt.get<DatabaseService>();
    _alerService = _getIt.get<AlertService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              bool result = await _authService.logout();
              if (result) {
                _navigationService.pushReplacementNamed(
                  '/login',
                );
              }
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: _chatList(),
    );
  }

  Widget _chatList() {
    return StreamBuilder(
        stream: _databaseService.getUserProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Unable to load! Please try again later.");
          }
          if (snapshot.data != null && snapshot.hasData) {
            final users = snapshot.data!.docs;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                UserProfile user = users[index].data();
                return ChatTile(
                  userProfile: user,
                  onTap: () async {
                    final _chatExists = await _databaseService.checkChatExists(
                      _authService.user!.uid,
                      user.uid!,
                    );
                    if (_chatExists) {
                    } else {
                      await _databaseService.createNewChat(
                        _authService.user!.uid,
                        user.uid!,
                      );
                    }
                  },
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
