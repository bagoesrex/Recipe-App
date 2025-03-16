import 'package:flutter/material.dart';
import 'package:recipe_app/data/dummy_data.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/categories.dart';
import 'package:recipe_app/screens/filters.dart';
import 'package:recipe_app/screens/recipes.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Recipe> _favoriteRecipes = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleRecipeFavoriteStatus(Recipe recipe) {
    final isExisting = _favoriteRecipes.contains(recipe);

    if (isExisting) {
      setState(() {
        _favoriteRecipes.remove(recipe);
      });
      _showInfoMessage('Recipe dihapus dari favorite.');
    } else {
      setState(() {
        _favoriteRecipes.add(recipe);
      });
      _showInfoMessage('Recipe ditambahkan ke favorite.');
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,)),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableRecipes =
        dummyRecipes.where((recipe) {
          if (_selectedFilters[Filter.glutenFree]! && !recipe.isGlutenFree) {
            return false;
          }
          if (_selectedFilters[Filter.lactoseFree]! && !recipe.isLactoseFree) {
            return false;
          }
          if (_selectedFilters[Filter.vegetarian]! && !recipe.isVegetarian) {
            return false;
          }
          if (_selectedFilters[Filter.vegan]! && !recipe.isVegan) {
            return false;
          }

          return true;
        }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleRecipeFavoriteStatus,
      availableRecipes: availableRecipes,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = RecipesScreen(
        recipes: _favoriteRecipes,
        onToggleFavorite: _toggleRecipeFavoriteStatus,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
