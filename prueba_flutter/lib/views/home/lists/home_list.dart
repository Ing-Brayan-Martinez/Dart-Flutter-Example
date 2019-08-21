import 'package:flutter/material.dart';
import 'package:prueba_flutter/domain/home.dart';
import 'package:prueba_flutter/repository/home_repository.dart';

class HomeList extends StatefulWidget {

  HomeList({Key key}) : super(key: key);

  @override
  HomeListState createState() => HomeListState();

}

class HomeListState extends State<HomeList> {

  final HomeRepository repository = new HomeRepository();
  List<Home> homes = new List();


  @override
  void initState() {
    super.initState();
    this.repository.findAllList()
        .then((list) => setState(() => this.homes = list));
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: this.homes.map((data) {

                return Card(
                  child: new Column(
                    children: <Widget>[
                      Image.asset(data.getImage().orElse("")),
                      ListTile(
                        leading: Icon(Icons.access_time),
                        title: Text(data.getTitle().orElse("")),
                        subtitle: Text(data.getSubTitle().orElse("")),
                      ),
                    ],
                  ),
                );

              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


}


