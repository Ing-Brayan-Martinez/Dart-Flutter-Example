import 'package:flutter/material.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';

class SeeCustomerScreen extends StatelessWidget {
  static const routeName = '/customer/see';

  const SeeCustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Customer? _customer;

    final Customer customer =
        ModalRoute.of(context)?.settings.arguments as Customer;

    if (customer != null) {
      _customer = customer;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos del Cliente"),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 200,
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/astronauta.jpg'),
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text("Codigo."),
            subtitle: Text(
              _customer?.code as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Nombre."),
            subtitle: Text(
              _customer?.name as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.directions),
            title: const Text("Direccion."),
            subtitle: Text(
              _customer?.adress as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text("Correo."),
            subtitle: Text(
              _customer?.mail as String,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Telefono."),
            subtitle: Text(
              _customer?.phone as String,
              style: const TextStyle(
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
        child: const Icon(Icons.edit),
        onPressed: () {
//          Navigator.pushNamed(context, UpdateCustomerScreen.routeName,
//              arguments: new UpdateCustomerEvent(_customer, ReloadCustomerUpdate.SEE_STRATEGY));
        },
      ),
    );
  }
}
