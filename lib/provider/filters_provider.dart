import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:riverpod/riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[active] = isActive;
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final filteredRecipesProvider = Provider((ref) {
  final recipes = ref.watch(RecipesProvider);
  final activeFilters = ref.watch(filtersProvider);

  return recipes.where((recipe) {
    if (activeFilters[Filter.glutenFree]! && !recipe.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !recipe.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !recipe.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !recipe.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
