
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/views/customer/form/update_cutomer_form.dart';

class UpdateCustomeScreen extends StatelessWidget {

  static const routeName = '/customer/update';

  UpdateCustomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Optional<Customer> customer =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
            title: Text("Editar Cliente"),
        ),
        body: UpdateCustomerForm(customerOpt: customer),
    );
  }

}