import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/data/dummy_data.dart';

final RecipesProvider = Provider((ref) {
  return dummyRecipes;
});
