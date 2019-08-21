import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {

  ItemsList({Key key}) : super(key: key);

  @override
  ItemsListState createState() => ItemsListState();

}

class ItemsListState extends State<ItemsList> {

  final List<String> _frutas = [
    'piña',
    'Limon',
    'Fresa',
    'Fresa',
    'Durasno',
    'Melon',
    'Parchita',
    'Melocoton',
    'Tamarindo'
        'Mora',
    'Guayaba'
  ];

  void _onSelectedItem(dynamic val) {

  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton.icon(
                  //color: Colors.red,
                  icon: Icon(Icons.filter_list), //`Icon` to display
                  label: Text('Filtrar'), //`Text` to display
                  onPressed: () {
                    //Code to execute when Floating Action Button is clicked
                    //...
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: _frutas.map((data) => ListTile(
                title: Text(data),
                trailing: PopupMenuButton(
                  onSelected: _onSelectedItem,
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: data,
                      child: Text("Ver"),
                    ),
                    PopupMenuItem(
                      value: data,
                      child: Text("Eliminar"),
                    ),
                    PopupMenuItem(
                      value: data,
                      child: Text("Compartir"),
                    ),
                  ],
                ),
              ))
                  .toList(),
            ),
          )

        ],
      ),
    );
  }

}