import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core/core.dart';
// import 'package:veda_news/presentation/providers/small_providers.dart';

/// [NavItem] is a widget that displays a category name as a selectable item in a navigation bar.
/// It visually indicates whether it is selected and triggers a callback function when tapped.
class NavItem extends ConsumerStatefulWidget {
  /// Index of the navigation item.
  final int index;

  /// The category name to be displayed.
  final String category;

  /// Indicates if this navigation item is currently selected.
  final bool isSelected;

  /// Callback function to be executed when the item is tapped.
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.index,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  ConsumerState<NavItem> createState() => _NavItemState();
}

class _NavItemState extends ConsumerState<NavItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 6.0), // Adds padding to the right of the text
            child: Text(
              capitalize(widget.category), // Capitalizes the category name
              style: GoogleFonts.poppins(
                color: widget.isSelected
                    ? Colors.black // Selected text color
                    : const Color(0xFF4E4B66), // Unselected text color
                fontSize: 16.0, // Font size for the text
                fontWeight: FontWeight.w400, // Font weight
              ),
            ),
          ),
          // Displays a blue underline when the item is selected
          if (widget.isSelected)
            Container(
              height: 2.0, // Height of the underline
              width: 19.0, // Width of the underline
              color: const Color(0xFF1877F2), // Blue color for the underline
            ),
        ],
      ),
    );
  }
}
