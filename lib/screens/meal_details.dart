import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen(
    {
      super.key,
      required this.meal,
    }
  );
  final Meal meal;

  

  @override
  Widget build(context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    void showInfoMessage(bool wasAdded, Meal meal){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          wasAdded ? ' "${meal.title}" Added to favorites' 
            : '"${meal.title}" Removed from favorites',
        )
      )
    );
  }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title
        ),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref.watch(favoriteMealsProvider.notifier)
                .toggleMealFavoriteStatus(meal);
              
              showInfoMessage(wasAdded, meal);

            }, 
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const MealTitleStyle(text: 'Ingredients'),

            DisplyAllMealInfo(infoList: meal.ingredients ),

            const MealTitleStyle(text: 'Steps'),

            DisplyAllMealInfo(infoList: meal.steps ),

            
          ],
        ),
      ),
    );
  }
}




class MealTitleStyle extends StatelessWidget {
  const MealTitleStyle(
    {
      super.key,
      required this.text
    }
  );

  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14,),
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}


class DisplyAllMealInfo extends StatelessWidget {
  const DisplyAllMealInfo({super.key, required this.infoList});

  final List<String> infoList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14,),
        for(final info in infoList)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4
            ),
            child: Text(
              info, 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
            ),
          )
      ],
    );
  }
}
