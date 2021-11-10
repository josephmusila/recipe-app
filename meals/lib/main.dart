import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String?,bool?> _filters={
    'glutune':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };
    List<Meal> availableMeals=DUMMY_MEALS;
  void _setFilters(Map<String,bool> filterData){
      setState(() {
        _filters=filterData;
        availableMeals=DUMMY_MEALS.where((meal) {
          if(_filters['glutene']==true && !meal.isGlutenFree){
              return false;
          } if(_filters['lactose']==true && !meal.isLactoseFree){
            return false;
          }if(_filters['vegan']==true && !meal.isVegan){
            return false;
          }if(_filters['vegetarian']==true && !meal.isVegetarian){
            return false;
          }
          return true;
        }).toList();


      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(

        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
            body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),

            ),
          title: TextStyle(
            fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed',
          )
        )
      ),
      initialRoute: '/',


      routes: {
        '/':(context)=>TabsScreen(),
        CategoryMealsScreen.roteName:(context)=>CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(),
        FiltersScreen.routeName:(context)=>FiltersScreen(currentFilters: _filters as Map<String,bool>?,setFilters: _setFilters,),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder:(context)=>Categories());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
       child: Text("Navigation "),
      ),

    );
  }
}
