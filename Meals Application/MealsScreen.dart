import 'package:flutter/material.dart';
import 'package:meals_application/DataModel/mealsDataModel.dart';

// Define a global list or a singleton for favorites
final Set<String> favoriteMealIds = {};

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, required this.mealList, required this.title});
  final String title;
  final List<Meal> mealList;

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  bool _isFavorite = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final mealId = widget.mealList.isNotEmpty ? widget.mealList[0].id : null;
    if (mealId != null) {
      _isFavorite = favoriteMealIds.contains(mealId);
    }
  }

  void _toggleFavorite() {
    final mealId = widget.mealList.isNotEmpty ? widget.mealList[0].id : null;
    if (mealId != null) {
      setState(() {
        if (_isFavorite) {
          favoriteMealIds.remove(mealId);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${widget.mealList[0].title} removed from favorites!'),
              duration: const Duration(seconds: 2),
            ),
          );
        } else {
          favoriteMealIds.add(mealId);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${widget.mealList[0].title} added to favorites!'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
        _isFavorite = !_isFavorite;
      });
    }
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else if (_selectedIndex == 1) {
        Navigator.of(context).pushReplacementNamed('/favorites');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.mealList.isNotEmpty ? widget.mealList[0] : null;

    List<Widget> ingredientWidgets = [
      const Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Ingredients",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Text(' ')
    ];
    if (meal != null) {
      var i = 1;
      for (var ingredient in meal.ingredients) {
        ingredientWidgets.add(
          Text(
            "$i. $ingredient",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        i++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _isFavorite ? Icons.star : Icons.star_border,
              color: _isFavorite ? Colors.white : Colors.grey,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 16, 23, 27),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 16, 23, 27),
        ),
        child: Center(
          child: Column(
            children: [
              if (meal != null)
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(meal.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(196, 0, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        height: 80,
                        child: Center(
                          child: Text(
                            meal.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (meal != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: ingredientWidgets,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 16, 23, 27),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
