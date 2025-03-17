import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/recipe.dart';

class FavoriteRecipesNotifier extends StateNotifier<List<Recipe>> {
  FavoriteRecipesNotifier() : super([]);

  bool toggleRecipeFavoriteStatus(Recipe recipe) {
    final recipeIsFavorite = state.contains(recipe);

    if (recipeIsFavorite) {
      state = state.where((r) => r.id != recipe.id).toList();
      return false;
    } else {
      state = [...state, recipe];
      return true;
    }
  }
}

final favoriteRecipesProvider =
    StateNotifierProvider<FavoriteRecipesNotifier, List<Recipe>>((ref) {
      return FavoriteRecipesNotifier();
    });
