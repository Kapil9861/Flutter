import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart' as p;
import 'package:get_it/get_it.dart';
import 'package:lets_chat/models/chat.dart';
import 'package:lets_chat/models/messages.dart';
import 'package:lets_chat/models/users_profile.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:lets_chat/services/auth_services.dart';
import 'package:lets_chat/services/database_service.dart';
import 'package:lets_chat/services/media_service.dart';
import 'package:lets_chat/services/storage_service.dart';
import 'package:lets_chat/utils.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

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
  late MediaService _mediaService;
  late StorageService _storageService;
  bool isVideo = false;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _databaseService = _getIt.get<DatabaseService>();
    _mediaService = _getIt.get<MediaService>();
    _storageService = _getIt.get<StorageService>();

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
        body: buildUI(context),
      ),
    );
  }

  Widget buildUI(BuildContext context) {
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
          inputOptions: InputOptions(alwaysShowSend: true, trailing: [
            _mediaMessageButton(),
            _videoMessageButton(context),
          ]),
          currentUser: currentUser!,
          onSend: sendMessage,
          messages: messages,
        );
      },
    );
  }

  Future<void> sendMessage(ChatMessage chatMessage) async {
    Message message;
    if ((!isVideo) && (chatMessage.medias?.isNotEmpty ?? false)) {
      message = Message(
        senderID: currentUser!.id,
        content: chatMessage.medias!.first.url,
        messageType: MessageType.Image,
        sentAt: Timestamp.fromDate(chatMessage.createdAt),
      );
    } else if ((isVideo) && (chatMessage.medias?.isNotEmpty ?? false)) {
      message = Message(
        senderID: currentUser!.id,
        content: chatMessage.medias!.first.url,
        messageType: MessageType.Video,
        sentAt: Timestamp.fromDate(chatMessage.createdAt),
      );
    } else {
      message = Message(
        senderID: currentUser!.id,
        content: chatMessage.text,
        messageType: MessageType.Text,
        sentAt: Timestamp.fromDate(chatMessage.createdAt),
      );
    }
    await _databaseService.sendChatMessage(
      currentUser!.id,
      widget.userProfile.uid!,
      message,
    );
  }

  List<ChatMessage> _generateChatMessagesList(List<Message> messages) {
    List<ChatMessage> chatMessages = messages.map((message) {
      String? fileType = lookupMimeType(message.content!); // Detect MIME type
      String fileExtension =
          path.extension(message.content!).toLowerCase(); // Get file extension

      if (message.messageType == MessageType.Image) {
        isVideo = false;
        return ChatMessage(
            user:
                currentUser!.id == message.senderID ? currentUser! : otherUser!,
            createdAt: message.sentAt!.toDate(),
            medias: [
              ChatMedia(
                url: message.content!,
                fileName: "",
                type: MediaType.image,
              )
            ]);
      } else if ((message.messageType == MessageType.Video) ||
          (fileType != null && fileType.startsWith('video/')) ||
          fileExtension == '.mp4' ||
          fileExtension == '.mov' ||
          fileExtension == '.avi' ||
          fileExtension == '.mkv') {
        isVideo = true;
        return ChatMessage(
            user:
                currentUser!.id == message.senderID ? currentUser! : otherUser!,
            createdAt: message.sentAt!.toDate(),
            medias: [
              ChatMedia(
                url: message.content!,
                fileName: "",
                type: MediaType.video,
              )
            ]);
      } else {
        isVideo = false;
        return ChatMessage(
          user: currentUser!.id == message.senderID ? currentUser! : otherUser!,
          text: message.content!,
          createdAt: message.sentAt!.toDate(),
        );
      }
    }).toList();
    chatMessages.sort((firstMessage, lastMessage) {
      return lastMessage.createdAt.compareTo(firstMessage.createdAt);
    });
    return chatMessages;
  }

  Widget _mediaMessageButton() {
    return IconButton(
      onPressed: () async {
        File? file = await _mediaService.getImageFromGallery();
        if (file != null) {
          String chatID = createChatId(
            currentUser!.id,
            otherUser!.id,
          );

          String? downloadUrl =
              await _storageService.uploadImageToChat(file, chatID);
          if (downloadUrl != null && !isVideo) {
            ChatMessage chatMessage = ChatMessage(
              user: currentUser!,
              createdAt: DateTime.now(),
              medias: [
                ChatMedia(
                  url: downloadUrl,
                  fileName: "",
                  type: MediaType.image,
                )
              ],
            );
            sendMessage(chatMessage);
          } else if (isVideo && downloadUrl != null) {
            ChatMessage chatMessage = ChatMessage(
              user: currentUser!,
              createdAt: DateTime.now(),
              medias: [
                ChatMedia(
                  url: downloadUrl,
                  fileName: "",
                  type: MediaType.video,
                )
              ],
            );
            sendMessage(chatMessage);
          }
        }
      },
      icon: const Icon(Icons.image),
    );
  }
}

Widget _videoMessageButton(BuildContext context) {
  return IconButton(
    onPressed: () async {
      p.MediaFile? singleMedia =
          (await p.GalleryPicker.pickMedia(context: context, singleMedia: true))
              as p.MediaFile?;
    },
    icon: const Icon(Icons.movie),
  );
}
