import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/core/utils.dart';

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });
  final int index;
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Text(
              capitalize(widget.category),
              style: GoogleFonts.poppins(
                color:
                    widget.isSelected ? Colors.black : const Color(0xFF4E4B66),
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (widget.isSelected)
            Container(
              height: 2.0,
              width: 19.0,
              color: const Color(0xFF1877F2),
            ),
        ],
      ),
    );
  }
}
