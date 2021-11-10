import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const roteName='/categories_meals';

  late final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var categoryTitle;
   late List<Meal> displayedMeals;
   bool _loadIitData=false;


  @override
  void initState() {
    //.....
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadIitData){
      final routeArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      final categoryid=routeArgs['id'];
      categoryTitle=routeArgs['title'];
      displayedMeals=widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      _loadIitData=true;
    }

    super.didChangeDependencies();
  }

  void _removeItem(String id){
      setState(() {
        displayedMeals.removeWhere((element) => element.id==id);
      });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Container(child: Center(
        child: ListView.builder(
          itemCount: displayedMeals.length,
            itemBuilder: (context,index){
                return MealItem(id:displayedMeals[index].id,
                    title: displayedMeals[index].title,
                    imageUrl: displayedMeals[index].imageUrl, 
                    duration: displayedMeals[index].duration, 
                    complexity: displayedMeals[index].complexity, 
                    affordability: displayedMeals[index].affordability, 
                    removeItem: _removeItem,
                
                );
            }
        ),
      ),),
    );
  }
}
