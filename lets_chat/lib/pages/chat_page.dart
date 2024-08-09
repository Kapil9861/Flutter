import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/models/chat.dart';
import 'package:lets_chat/models/messages.dart';
import 'package:lets_chat/models/users_profile.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/services/database_service.dart';

class ChatPage extends StatefulWidget {
  final UserProfile userProfile;
  const ChatPage({
    super.key,
    required this.userProfile,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  ChatUser? currentUser, otherUser;
  late DatabaseService _databaseService;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _databaseService = _getIt.get<DatabaseService>();
    currentUser = ChatUser(
      id: _authService.user!.uid,
      firstName: _authService.user!.displayName,
    );
    otherUser = ChatUser(
      id: widget.userProfile.uid!,
      firstName: widget.userProfile.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 65, 1, 229),
          title: Text(
            widget.userProfile.name!,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "${widget.userProfile.pfpURL}",
                ),
              ),
            )
          ],
        ),
        body: buildUI(),
      ),
    );
  }

  Widget buildUI() {
    return StreamBuilder(
      stream: _databaseService.getChatData(
        currentUser!.id,
        widget.userProfile.uid!, //otherUser!.id
      ),
      builder: (context, snapshot) {
        Chat? chat = snapshot.data?.data();
        List<ChatMessage> messages = [];
        if (chat != null && chat.messages != null) {
          messages = _generateChatMessagesList(chat.messages!);
        }
        return DashChat(
          messageOptions: const MessageOptions(
            showOtherUsersAvatar: true,
            showCurrentUserAvatar: true,
            showTime: true,
          ),
          inputOptions: InputOptions(
              alwaysShowSend: true, trailing: [_mediaMessageButton()]),
          currentUser: currentUser!,
          onSend: sendMessage,
          messages: messages,
        );
      },
    );
  }

  Future<void> sendMessage(ChatMessage chatMessage) async {
    Message message = Message(
      senderID: currentUser!.id,
      content: chatMessage.text,
      messageType: MessageType.Text,
      sentAt: Timestamp.fromDate(chatMessage.createdAt),
    );
    await _databaseService.sendChatMessage(
      currentUser!.id,
      widget.userProfile.uid!,
      message,
    );
  }

  List<ChatMessage> _generateChatMessagesList(List<Message> messages) {
    List<ChatMessage> chatMessages = messages.map((message) {
      return ChatMessage(
        user: currentUser!.id == message.senderID ? currentUser! : otherUser!,
        text: message.content!,
        createdAt: message.sentAt!.toDate(),
      );
    }).toList();
    chatMessages.sort((firstMessage, lastMessage) {
      return lastMessage.createdAt.compareTo(firstMessage.createdAt);
    });
    return chatMessages;
  }

  Widget _mediaMessageButton() {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.image));
  }
}
