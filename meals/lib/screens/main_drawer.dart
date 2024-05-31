import 'package:flutter/material.dart';
import 'package:meals/screens/list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.setScreen,
  });

  final Function(String screenIdentifier) setScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Cooking Meals...",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                )
              ],
            ),
          ),
          ListTileScreen(
            icon: const Icon(Icons.restaurant),
            onTap: () {
              setScreen("meals");
            },
            title: "Meals",
          ),
          ListTileScreen(
            icon: const Icon(Icons.settings),
            onTap: () {
              setScreen("filters");
            },
            title: "Filters",
          )
        ],
      ),
    );
  }
}
