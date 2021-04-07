
import 'package:flutter/material.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';


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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Datos del Cliente"),
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
              _customer.code,
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
              _customer.name,
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
              _customer.adress,
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
              _customer.mail,
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
              _customer.phone,
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
//          Navigator.pushNamed(context, UpdateCustomerScreen.routeName,
//              arguments: new UpdateCustomerEvent(_customer, ReloadCustomerUpdate.SEE_STRATEGY));
        },
      ),
    );
  }

}
