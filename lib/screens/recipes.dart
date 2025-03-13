import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/recipe_details.dart';
import 'package:recipe_app/widgets/recipe_item.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({
    super.key,
    this.title,
    required this.recipes,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Recipe> recipes;
  final void Function(Recipe recipe) onToggleFavorite;

  void selectRecipe(BuildContext context, Recipe recipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => RecipeDetailsScreen(
              recipe: recipe,
              onToggleFavorite: onToggleFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Yah, Kosong...",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "Coba lihat category lain :D",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );

    if (recipes.isNotEmpty) {
      body = ListView.builder(
        itemCount: recipes.length,
        itemBuilder:
            (ctx, index) => RecipeItem(
              recipe: recipes[index],
              onSelectRecipe: (context, recipe) {
                selectRecipe(context, recipe);
              },
            ),
      );
    }

    if (title == null) {
      return body;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: body);
  }
}
