import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  State<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  int _currentScreenIndex = 0;
  final List<MealModel> _favoriteMeals = [];

  _selectPage(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleFavorites(MealModel meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
        _showSnackbar("Removed ${meal.title} from favorites");
      } else {
        _favoriteMeals.add(meal);
        _showSnackbar("Added ${meal.title} to favorites");
      }
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      // Navigator.of(context).pushReplacement(
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) {
            return const FilterScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavorites: _toggleFavorites,
    );
    String activePageTitle = "Categories";

    if (_currentScreenIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorites: _toggleFavorites,
      );
      activePageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
        currentIndex: _currentScreenIndex,
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
    );
  }
}
