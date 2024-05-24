
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
    {
      super.key,
      required this.meal,
      required this.onMealClicked
    }
  );

  final Meal meal;
  final void Function(Meal meal) onMealClicked;
  
  // make first letter uppercase
  String get complexityText => 
    meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);

  String get affordabilityText => 
    meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 6,
      child: InkWell(
        onTap: () {
          onMealClicked(meal);
        },
        splashColor: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                  vertical: 6
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          label: '${meal.duration} min',
                          icon: Icons.schedule
                        ),
                        const SizedBox(width: 12,),
                        MealItemTrait(
                          label: complexityText, 
                          icon: Icons.work
                        ),
                        const SizedBox(width: 12,),
                        MealItemTrait(
                          label: affordabilityText, 
                          icon: Icons.attach_money
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}    