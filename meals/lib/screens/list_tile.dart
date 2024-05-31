import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });
  final Icon icon;
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      onTap: onTap,
    );
  }
}
