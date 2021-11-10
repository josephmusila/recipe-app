import 'package:flutter/material.dart';
import 'package:meals/widgets/categoryItem.dart';
import 'package:meals/dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ) ,
      children: DUMMY_CATEGORIES.map((catItem) => CategoryItem(
          id: catItem.id,
          title: catItem.title,
          color: catItem.color)).toList(),

    );
  }
}
