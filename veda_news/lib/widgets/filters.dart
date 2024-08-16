import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_news/core/utils.dart';
import 'package:veda_news/widgets/nav_item.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            width: 380,
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
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 34,
            child: Row(
              children: categories.map(
                (category) {
                  int index = category.indexOf(category);
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NavItem(category: category, index: index),
                  );
                },
              ).toList(),
            ),
          ),
        )
      ],
    );
  }
}
