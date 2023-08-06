import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorites,
  });

  final MealModel meal;
  final void Function(MealModel meal) onToggleFavorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorites(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: ListView(
        children: [
          Image.network(meal.imageUrl),
          const SizedBox(height: 16),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          for (final ingredient in meal.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            "Steps",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                step,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
