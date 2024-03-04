import 'package:flutter/material.dart';

class MenuItemProperty extends StatelessWidget {
  const MenuItemProperty(
      {super.key, required this.icon, required this.label, required});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
