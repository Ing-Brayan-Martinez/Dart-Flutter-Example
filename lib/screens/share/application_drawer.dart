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
            accountName: Text("Ashish Rawat"),
            accountEmail: Text("ashishrawat2911@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/astronauta.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Inicio"),
            onTap: () {
              widget.delegate.navigateToHome(context);
            },
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Clientes"),
            onTap: () {
              widget.delegate.navigateToCustomer(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text("Facturas"),
            onTap: () {
              widget.delegate.navigateToInvoiced(context);
            },
          ),
          Divider(
            color: Colors.black26,
            indent: 10,
            endIndent: 10,
            height: 16,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracion"),
            onTap: () {
              widget.delegate.navigateToSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("Acerca De"),
            onTap: () {
              widget.delegate.navigateToAbout(context);
            },
          ),
        ],
      ),
    );
  }
}
