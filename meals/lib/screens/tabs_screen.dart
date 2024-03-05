import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favouriteMeal = [];
  void toggleFavouriteAction(Meal meal) {
    setState(() {
      if (_favouriteMeal.contains(meal)) {
        _favouriteMeal.remove(meal);
        notify("Removed from the favourite!");
      } else {
        _favouriteMeal.add(meal);
        notify("Added to the favourite!");
      }
    });
  }

  void notify(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  int selectedPageIndex = 0;

  late Widget content = CategoriesScreen(
    toggleFavourites: toggleFavouriteAction,
  );

  String title = "Categories";

  @override
  Widget build(BuildContext context) {
    void opTapBottomBar(index) {
      setState(() {
        selectedPageIndex = index;
      });
    }

    if (selectedPageIndex == 0) {
      setState(() {
        content = CategoriesScreen(
          toggleFavourites: toggleFavouriteAction,
        );
      });

      title = "Categories";
    } else {
      setState(() {
        content = MealsScreen(
          meal: _favouriteMeal,
          toggleFavourites: toggleFavouriteAction,
        );
      });
      title = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: opTapBottomBar,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
      body: content,
    );
  }
}
