import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorites,
  });

  final String? title;
  final List<MealModel> meals;
  final void Function(MealModel meal) onToggleFavorites;

  void onSelectMeal(BuildContext context, MealModel meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal, onToggleFavorites: onToggleFavorites),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ooh oh!...nothing is here",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 10),
          Text(
            "Try selecting a different category!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              onSelectMeal(context, meal);
            }),
      );
    }

    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
    );
  }
}
