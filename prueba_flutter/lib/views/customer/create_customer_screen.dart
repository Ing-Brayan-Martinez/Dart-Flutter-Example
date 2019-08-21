
import 'package:flutter/material.dart';
import 'package:prueba_flutter/views/customer/form/create_cutomer_form.dart';

class CreateCustomeScreen extends StatelessWidget {

  static const routeName = '/customer/create';

  CreateCustomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Cliente"),
      ),
      body: CreateCustomerForm(),
    );
  }

}