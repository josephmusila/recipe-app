import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/favourites.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 final  List<Map<String,Object>>pages=[
    {"page":Categories(),"title":"Categories",},
    {"page":FavouritesScreen(),"title":"Favourites",}
  ];

  int selectedPageIndex=0;
  void selectPage(int index){
      setState(() {
        selectedPageIndex=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'].toString()),

      ),
    drawer:MainDRawer(),
    body: pages[selectedPageIndex]["page"]  as Widget,
     bottomNavigationBar: BottomNavigationBar(
       onTap: selectPage,
       backgroundColor: Theme.of(context).primaryColor,
       unselectedItemColor: Colors.white,
       selectedItemColor: Theme.of(context).accentColor,
       currentIndex: selectedPageIndex,
       type: BottomNavigationBarType.shifting,
       items: [
         BottomNavigationBarItem(
           backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.category),title: Text("Categories")),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.star),title: Text("Favourites"))
       ],
     ),
    );
  }
}
