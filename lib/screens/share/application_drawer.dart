import 'package:dart_flutter_example/controllers/delegated/drawer_delegate.dart';
import 'package:flutter/material.dart';

class ApplicationDrawer extends StatefulWidget {
  final DrawerDelegate delegate;

  const ApplicationDrawer({Key? key, required this.delegate}) : super(key: key);

  @override
  ApplicationDrawerState createState() => ApplicationDrawerState();
}

class ApplicationDrawerState extends State<ApplicationDrawer>
    with SingleTickerProviderStateMixin {
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("Ashish Rawat"),
            accountEmail: const Text("ashishrawat2911@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: const Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/astronauta.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
            onTap: () {
              widget.delegate.navigateToHome(context);
            },
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Clientes"),
            onTap: () {
              widget.delegate.navigateToCustomer(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text("Facturas"),
            onTap: () {
              widget.delegate.navigateToInvoiced(context);
            },
          ),
          const Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configuracion"),
            onTap: () {
              widget.delegate.navigateToSettings(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Acerca De"),
            onTap: () {
              widget.delegate.navigateToAbout(context);
            },
          ),
        ],
      ),
    );
  }
}
