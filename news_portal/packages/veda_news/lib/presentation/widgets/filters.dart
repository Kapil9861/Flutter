import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veda_news/presentation/providers/small_providers.dart';
import 'package:veda_news/presentation/widgets/nav_item.dart'; // Custom NavItem widget
import 'package:google_fonts/google_fonts.dart'; // For custom fonts
import 'package:core/core.dart';

/// [Filters] widget is used to display a list of selectable categories.
/// It includes a section with "Latest" and "See all" buttons and a horizontal list of categories.
class Filters extends ConsumerStatefulWidget {
  /// The currently selected category.
  final String selectedCategory;

  final Function(String) onCategorySelected;

  const Filters({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  ConsumerState<Filters> createState() => _FiltersState();
}

class _FiltersState extends ConsumerState<Filters> {
  @override
  Widget build(BuildContext context) {
    String selectedCategory = ref.watch(selectedCategoryProvider);
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
                  onPressed: () {},
                  child: Text(
                    "Latest",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
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
                    isSelected: selectedCategory == category,
                    onTap: () {
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
