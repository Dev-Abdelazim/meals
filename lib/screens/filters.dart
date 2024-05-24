
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
          children: [
            SwitchFiltersScreenItem(
              title: 'Cluten-free', 
              subtitle: 'Only include gluten-free meals', 
              value: activeFilter[Filter.glutenFree]!, 
              onTogglesClick: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                  Filter.glutenFree,
                  isChecked
                );
              }
            ),
        
            SwitchFiltersScreenItem(
              title: 'Lactose-free', 
              subtitle: 'Only include Lactose-free meals', 
              value: activeFilter[Filter.lactoseFree]!, 
              onTogglesClick: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                  Filter.lactoseFree,
                  isChecked
                );
              }
            ),
        
            SwitchFiltersScreenItem(
              title: 'Vegetarian', 
              subtitle: 'Only include vegetarian meals', 
              value: activeFilter[Filter.vegetarian]!, 
              onTogglesClick: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                  Filter.vegetarian,
                  isChecked
                );
              }
            ),
        
            SwitchFiltersScreenItem(
              title: 'Vegan', 
              subtitle: 'Only include vegan meals', 
              value: activeFilter[Filter.vegan]!, 
              onTogglesClick: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                  Filter.vegan,
                  isChecked
                );
              }
            )
          ],
        ),
    );
  }
}



class SwitchFiltersScreenItem extends StatelessWidget {
  const SwitchFiltersScreenItem(
    {
      super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.onTogglesClick
    }
  );

  final bool value;
  final void Function(bool onChecked) onTogglesClick;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value, 
      onChanged: onTogglesClick,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}