import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  Widget content = const CategoriesScreen();
  String title = "Categories";

  void _opTapBottonBar(index) {
    setState(() {
      selectedPageIndex = index;
    });
    if (selectedPageIndex == 0) {
      content = const CategoriesScreen();
      title = "Categories";
    } else {
      title = "Favourites";
      content = MealsScreen(
        meal: [],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: _opTapBottonBar,
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
