
import 'package:flutter/material.dart';
import 'package:prueba_flutter/legacy/domain/customer.dart';
import 'package:prueba_flutter/views/customer/event/update_customer_event.dart';
import 'package:prueba_flutter/views/customer/strategy/update/reload_customer_update.dart';
import 'package:prueba_flutter/views/customer/update_customer_screen.dart';

class SeeCustomerScreen extends StatelessWidget {

  static const routeName = '/customer/see';

  SeeCustomerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Customer _customer = new Customer();

    final Customer customer =
        ModalRoute.of(context).settings.arguments;

    if (customer != null) {
      _customer = customer;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Datos del Cliente"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: Center(
              child:  CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/astronauta.jpg'),
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text("Codigo."),
            subtitle:Text(
              _customer.getCode().orElse(""),
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Nombre."),
            subtitle:Text(
              _customer.getName().orElse(""),
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.directions),
            title: Text("Direccion."),
            subtitle:Text(
              _customer.getAdress().orElse(""),
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text("Correo."),
            subtitle:Text(
              _customer.getMail().orElse(""),
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Telefono."),
            subtitle:Text(
              _customer.getPhone().orElse(""),
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btnClient",
        tooltip: 'Editar clientes.',
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.pushNamed(context, UpdateCustomerScreen.routeName,
              arguments: new UpdateCustomerEvent(_customer, ReloadCustomerUpdate.SEE_STRATEGY));
        },
      ),
    );
  }

}