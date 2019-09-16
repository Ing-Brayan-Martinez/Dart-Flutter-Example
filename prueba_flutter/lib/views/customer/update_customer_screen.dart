
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/views/customer/form/update_cutomer_form.dart';

import 'event/update_customer_event.dart';

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