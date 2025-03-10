import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key, required this.title, required this.recipes});

  final String title;
  final List<Recipe> recipes;

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
        itemBuilder: (ctx, index) => Text(recipes[index].title),
      );
    }

    return Scaffold(appBar: AppBar(title: Text(title)), body: body);
  }
}
