import 'package:flutter/material.dart';
import 'package:recipe_app/data/dummy_data.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/recipes.dart';
import 'package:recipe_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableRecipes});

  final List<Recipe> availableRecipes;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredRecipes =
        widget.availableRecipes
            .where((recipe) => recipe.categories.contains(category.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) =>
                RecipesScreen(title: category.title, recipes: filteredRecipes),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectedCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
