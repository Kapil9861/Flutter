import 'package:flutter/material.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool switchState = false;

//This is for the side drawer in the Pop Up Screens too MoreOver, the screenReplacement
//is used to remove the back button as it replaces the Screen ontop of which it is placed
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
              color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
        ),
      ),
      // drawer: MainDrawer(setScreen: chooseScreen),
      body: Column(
        children: [
          SwitchListTile(
            value: switchState,
            onChanged: (isChecked) {
              setState(() {
                switchState = isChecked;
              });
            },
            title: Text(
              "Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "This only contains the gluten free meals.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
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
