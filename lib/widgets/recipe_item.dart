import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.recipe});

  final Recipe recipe;

  String get complexityText {
    return recipe.complexity.name[0].toUpperCase() +
        recipe.complexity.name.substring(1);
  }

  String get affordabilityText {
    return recipe.affordability.name[0].toUpperCase() +
        recipe.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(recipe.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Column(
                  children: [
                    Text(
                      recipe.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RecipeItemTrait(
                          icon: Icons.schedule,
                          label: '${recipe.duration} min',
                        ),
                        const SizedBox(width: 12),
                        RecipeItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        RecipeItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
