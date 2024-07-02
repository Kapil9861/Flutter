import 'package:flutter/material.dart';

// import 'package:meals/screens/main_drawer.dart';
// import 'package:meals/screens/tabs_screen.dart';
/// A screen for applying filters to meals.
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenSwitchState = false;
  bool lactoseSwitchState = false;
  bool vegetablesSwitchState = false;
  bool veganSwitchState = false;

  ///This is for the side drawer in the Pop Up Screens too MoreOver, the screenReplacement
  ///is used to remove the back button as it replaces the Screen ontop of which it is placed
  // void chooseScreen(String identifier) {
  //   Navigator.of(context).pop();
  //   if (identifier == "meals") {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const TabsScreen(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
        ),
      ),
      // drawer: MainDrawer(setScreen: chooseScreen),
      body: Column(
        children: [
          SwitchListTile(
            value: glutenSwitchState,
            onChanged: (isChecked) {
              setState(() {
                glutenSwitchState = isChecked;
              });
            },
            title: Text(
              "Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "This only contains the gluten free meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
          ),
          SwitchListTile(
            value: lactoseSwitchState,
            onChanged: (isChecked) {
              setState(() {
                lactoseSwitchState = isChecked;
              });
            },
            title: Text(
              "Lactose-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "This only contains the lactose free meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
          ),
          SwitchListTile(
            value: vegetablesSwitchState,
            onChanged: (isChecked) {
              setState(() {
                vegetablesSwitchState = isChecked;
              });
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "This only contains the vegetarian meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
          ),
          SwitchListTile(
            value: veganSwitchState,
            onChanged: (isChecked) {
              setState(() {
                veganSwitchState = isChecked;
              });
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "This only contains the vegan meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
          ),
        ],
      ),
    );
  }
}
