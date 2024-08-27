import 'package:flutter/material.dart';
import 'package:meals_application/Data/CategoryData.dart';
import 'package:meals_application/DataModel/categoryModel.dart';
import 'package:meals_application/MealsScreen.dart';

class GridCards extends StatelessWidget {
  const GridCards({super.key,required this.data});

  final CategoryDataModel data;

  void _selectedCategory(BuildContext context,CategoryDataModel category){
    final filteredList = dummyMeals.where((element) => element.categories.contains(category.id)).toList();
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context)=>MealsScreen(
              title: category.title,
              mealList: filteredList,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _selectedCategory(context, data);
      },
      splashColor: Colors.black.withOpacity(.5),
      borderRadius:BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            data.color.withOpacity(.5),
            data.color.withOpacity(1),
          ]),
        ),
        
        child: Center(child: Text(data.title,style: const TextStyle(fontSize: 20,color:Colors.white),)),
      ),
    );
  }
}