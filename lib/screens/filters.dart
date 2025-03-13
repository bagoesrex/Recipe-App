import 'package:flutter/material.dart';
// import 'package:recipe_app/screens/tabs.dart';
// import 'package:recipe_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<FiltersScreen> createState() {
    return _filterScreenState();
  }
}

class _filterScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "recipes") {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => const TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: _gluttenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Glutten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only include glutten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
