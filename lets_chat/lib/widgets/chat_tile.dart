import 'package:flutter/material.dart';
import 'package:lets_chat/models/users_profile.dart';

class ChatTile extends StatelessWidget {
  final UserProfile userProfile;
  final Function onTap;
  const ChatTile({
    super.key,
    required this.userProfile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      dense: false,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userProfile.pfpURL ??
            "https://cdn-icons-png.flaticon.com/512/9131/9131529.png"),
      ),
      title: Text(userProfile.name!),
      // subtitle: Text(userProfile.),
    );
  }
}
