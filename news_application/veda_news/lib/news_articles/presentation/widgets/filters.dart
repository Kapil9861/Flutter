import 'package:flutter/material.dart';
import 'package:veda_news/core/utils.dart'; // Assumed utility functions and data like `categories`
import 'package:veda_news/news_articles/presentation/widgets/nav_item.dart'; // Custom NavItem widget
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

/// [Filters] widget is used to display a list of selectable categories.
/// It includes a section with "Latest" and "See all" buttons and a horizontal list of categories.
class Filters extends StatefulWidget {
  /// The currently selected category.
  final String selectedCategory;

  /// Callback function to handle category selection.
  final Function(String) onCategorySelected;

  const Filters({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Section with "Latest" and "See all" buttons
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle "Latest" button press
                  },
                  child: Text(
                    "Latest",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle "See all" button press
                  },
                  child: Text(
                    "See all",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF4E4B66),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Horizontal list of categories
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: SizedBox(
            height: 34,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  String category = categories[index];
                  return NavItem(
                    category: category,
                    index: index,
                    isSelected: widget.selectedCategory == category,
                    onTap: () {
                      // Call the callback function with the selected category
                      widget.onCategorySelected(category);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
