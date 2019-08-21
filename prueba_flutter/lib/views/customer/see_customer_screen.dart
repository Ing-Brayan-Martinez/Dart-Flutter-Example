
import 'package:flutter/material.dart';

class SeeCustomeScreen extends StatelessWidget {

  static const routeName = '/customer/see';

  SeeCustomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Cliente"),
      ),
      body: Center(
        child: Text("Hello Word"),
      ),
    );
  }

}