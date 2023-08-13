import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';

class FavoritesMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleFavoriteMeals(MealModel meal) {
    final isFavoriteMeal = state.contains(meal);

    if (isFavoriteMeal) {
      state = state.where((val) => val.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<MealModel>>((ref) {
  return FavoritesMealsNotifier();
});
