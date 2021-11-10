import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const routeName="/filters-screen";

  Function setFilters;
   Map<String,bool>? currentFilters;

  FiltersScreen({required this.currentFilters,required this.setFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
           bool _gluteeFree=false;
           bool _vegetarian=false;
           bool _vegan=false;
           bool _lactoseFree=false;

    @override
      initState(){
      _gluteeFree=widget.currentFilters!['glutene'] as bool;
      _vegetarian=widget.currentFilters!['vegetarian'] as bool;
      _vegan=widget.currentFilters!['vegan'] as bool;
      _lactoseFree=widget.currentFilters!['lactose'] as bool;
      super.initState();
    }

  Widget _builSwitchListTile(String title,String description,bool currentValue,Function updateValue){
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue as  Function(bool),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: (){
                final selectedFilters= {
                  'glutune': _gluteeFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.setFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer:MainDRawer(),
      body: Column(
        children: [
           Container(
             padding: EdgeInsets.all(20),
             child: Text("Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
             ),

           ),
          Expanded(
              child: ListView(
                children: [
                    _builSwitchListTile("Glutene-free", "only Contains glutene free meals", _gluteeFree, (newValue) {
                      setState(() {
                        _gluteeFree=newValue;
                      });
                    }),
                  _builSwitchListTile("Lactose-free", "only Contains glutene free meals", _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  }),
                  _builSwitchListTile("Vegetarian", "only Contains Vegetarian meals", _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian=newValue;
                    });
                  }),
                  _builSwitchListTile("Vegan", "only Contains vegan  meals", _vegan, (newValue) {
                    setState(() {
                      _vegan=newValue;
                    });
                  }),
                ],
              )
          )
          
        ],
      ),
    );
  }
}
