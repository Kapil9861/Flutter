import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/menu_item_property.dart';
import 'package:meals/widgets/styled_text.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({
    super.key,
    required this.meal,
     required this.toggleFavourite,
  });
  final Meal meal;

  final Function(Meal meal) toggleFavourite;

  String get complexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
               toggleFavourite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuItemProperty(
                    icon: Icons.schedule,
                    label: '${meal.duration} min',
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  MenuItemProperty(
                    icon: Icons.work,
                    label: complexity,
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  MenuItemProperty(
                    icon: Icons.attach_money,
                    label: affordability,
                  )
                ],
              ),
              const SizedBox(height: 16),
              const StyledText.title(text: "Ingedrients"),
              const SizedBox(
                height: 12,
              ),
              for (final ingedrient in meal.ingredients)
                StyledText(text: ingedrient),
              const SizedBox(height: 16),
              const StyledText.title(text: "Steps:"),
              const SizedBox(
                height: 12,
              ),
              for (final step in meal.steps)
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: StyledText(text: step)),
              const SizedBox(height: 16),
              const StyledText.title(text: "Important Notice:"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (meal.isGlutenFree == true)
                      ? const StyledText(
                          text: "Gluten free",
                        )
                      : const StyledText(
                          text: "Contains Gluten",
                        ),
                  const SizedBox(
                    width: 16,
                  ),
                  (meal.isVegan == true)
                      ? const StyledText(
                          text: "Vegan",
                        )
                      : const StyledText(
                          text: "Non Vegan",
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (meal.isVegetarian == true)
                      ? const StyledText(
                          text: "Vegetarian",
                        )
                      : const StyledText(
                          text: "Not Vegetarian",
                        ),
                  const SizedBox(
                    width: 16,
                  ),
                  (meal.isLactoseFree == true)
                      ? const StyledText(
                          text: "Lactose free",
                        )
                      : const StyledText(
                          text: "Contains Lactose",
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
