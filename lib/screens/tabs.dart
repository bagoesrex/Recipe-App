import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/provider/favorites_provider.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
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

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Recipe> _favoriteRecipes = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipes = ref.watch(RecipesProvider);
    final availableRecipes =
        recipes.where((recipe) {
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

    Widget activePage = CategoriesScreen(availableRecipes: availableRecipes);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteRecipes = ref.watch(favoriteRecipesProvider);
      activePage = RecipesScreen(recipes: favoriteRecipes);
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
