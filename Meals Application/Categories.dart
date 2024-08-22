import 'package:flutter/material.dart';
import 'package:meals_application/Data/CategoryData.dart';
import 'package:meals_application/Widgets/GridCards.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 49, 56),
      appBar: AppBar(
        title: const Text('Pick Your Category'),
        backgroundColor: const Color.fromARGB(255, 16, 23, 27),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(16),
        child: GridView(gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final data in availableCategories)
              GridCards(data: data,)
          ],
          ),
      ),
    ) ;
  }
}