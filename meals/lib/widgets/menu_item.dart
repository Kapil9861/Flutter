import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/menu_item_property.dart';
import 'package:transparent_image/transparent_image.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.meal,
    required this.toggleFavourites,
  });
  final Meal meal;
 final Function(Meal meal) toggleFavourites;

  String get complexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void mealDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetail(
          meal: meal,
          toggleFavourite: toggleFavourites,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 13,
      child: InkWell(
        onTap: () {
          mealDetail(context);
        },
        splashColor: Theme.of(context).colorScheme.onBackground,
        radius: 16,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: const Color.fromARGB(140, 0, 0, 0),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MenuItemProperty(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        MenuItemProperty(
                          icon: Icons.work,
                          label: complexity,
                        ),
                        MenuItemProperty(
                          icon: Icons.attach_money,
                          label: affordability,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
