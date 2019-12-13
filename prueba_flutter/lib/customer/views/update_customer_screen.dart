
import 'package:flutter/material.dart';

import 'form/update_cutomer_form.dart';


class UpdateCustomerScreen extends StatelessWidget {

  static const routeName = '/customer/update';

  UpdateCustomerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text("Editar Cliente"),
        ),
        body: UpdateCustomerForm(),
    );
  }

}