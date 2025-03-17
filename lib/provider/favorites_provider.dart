import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';

class FavoriteRecipesNotifier extends StateNotifier<List<Recipe>> {
  FavoriteRecipesNotifier() : super([]);

  void toggleRecipeFavoriteStatus(Recipe recipe) {
    final recipeIsFavorite = state.contains(recipe);

    if (recipeIsFavorite) {
      state = state.where((r) => r.id != recipe.id).toList();
    } else {
      state = [...state, recipe];
    }
  }
}

final favoriteRecipesProvider =
    StateNotifierProvider<FavoriteRecipesNotifier, List<Recipe>>((ref) {
      return FavoriteRecipesNotifier();
    });
