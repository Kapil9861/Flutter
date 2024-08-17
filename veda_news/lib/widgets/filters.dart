import 'package:flutter/material.dart';
import 'package:veda_news/core/utils.dart';
import 'package:veda_news/widgets/nav_item.dart';
import 'package:google_fonts/google_fonts.dart';

class Filters extends StatefulWidget {
  final String selectedCategory;
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
