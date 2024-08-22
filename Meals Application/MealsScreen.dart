import 'package:flutter/material.dart';
import 'package:meals_application/DataModel/mealsDataModel.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,required this.mealsList,required this.title});

  final String title;
  final List<Meal> mealsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Column(
          children: [
            Text(mealsList[0].title),
            Image.network(mealsList[0].imageUrl)
          ],
        ),
      ),
    );
  }
}