import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/provider/favorites_provider.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipes = ref.watch(favoriteRecipesProvider);

    final isfavorite = favoriteRecipes.contains(recipe);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteRecipesProvider.notifier)
                  .toggleRecipeFavoriteStatus(recipe);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? 'Recipe ditambahkan ke favorite.'
                        : 'Recipe dihapus dari favorite.',
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.7, end: 1).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isfavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isfavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: recipe.id,
              child: Image.network(
                recipe.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in recipe.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            for (final step in recipe.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
