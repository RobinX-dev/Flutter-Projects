import 'package:flutter/material.dart';
import 'package:meals_application/Data/CategoryData.dart';
import 'package:meals_application/Widgets/GridCards.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 14, 16),
      appBar: AppBar(
        title: const Text('Pick Your Category'),
        backgroundColor: const Color.fromARGB(255, 16, 23, 27),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 16, 23, 27),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 16, 23, 27),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cooking',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.filter_list, color: Colors.white),
              title: const Text(
                'Filter',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Add your onTap action here
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text(
                'Favorite',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15,
          ),
          children: [
            for (final data in availableCategories)
              GridCards(data: data),
          ],
        ),
      ),
    );
  }
}
