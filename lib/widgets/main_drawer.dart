
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer(
    {
      super.key,
      required this.onSelectScreen
    }
  );

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood, 
                  size: 50, 
                  color: Theme.of(context).colorScheme.primary
                ),
                const SizedBox(width: 18,),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),
                )
              ],
            )
          ),

          DrawerContentItem(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () { onSelectScreen('Meals'); }
          ),

          DrawerContentItem(
            title: 'Filters',
            icon: Icons.settings,
            onTap: () { onSelectScreen('Filters'); }
          ),
          
        ],
      ),
    );
  }
}




class DrawerContentItem extends StatelessWidget {
  const DrawerContentItem(
    {
      super.key,
      required this.title,
      required this.icon,
      required this.onTap
    }
  );

  final String title;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      onTap: onTap,
      title: Text(
        title, 
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 24,
        )
      ),
    );
  }
}