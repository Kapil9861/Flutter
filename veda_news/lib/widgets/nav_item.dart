import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/core/utils.dart';

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.category,
  });
  final int index;
  final String category;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isSelected = _selectedIndex == widget.index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = widget.index; // Update selected index
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              capitalize(widget.category),
              style: GoogleFonts.poppins(
                color: isSelected ? Colors.blue : Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              height: 2.0,
              width: 20.0,
              color: Colors.blue, 
            ),
        ],
      ),
    );
  }
}
