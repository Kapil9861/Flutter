import 'package:flutter/material.dart';
import 'package:meals/datas/category_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(meal: dummyMeals, title: "Test"),
      ),
    );
    /*Exactly same as above just the approach is different and this in fact is more popular!*/
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) => const MealsScreen(meal: dummyMeals, title: "Test"),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Your Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        //Provides the number of columns
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 30,
          childAspectRatio: 3 / 2,
        ),

        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context);
              },
            )
        ],
      ),
    );
  }
}
