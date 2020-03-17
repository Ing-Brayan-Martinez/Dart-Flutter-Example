import 'package:flutter/material.dart';
import 'package:prueba_flutter/behavior/delegated/delegated.dart';


class AppDrawer extends StatefulWidget {

  Delegated delegated;
  
  AppDrawer({Key key, this.delegated}) : super(key: key);

  @override
  AppDrawerState createState() => AppDrawerState();

}

class AppDrawerState extends State<AppDrawer> with SingleTickerProviderStateMixin {

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
              backgroundColor:
              Theme.of(context).platform == TargetPlatform.iOS ? Colors.blue : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/astronauta.jpg'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Inicio"),
            onTap: () {
              widget.delegated.onHome(context);
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
              widget.delegated.onCustomer(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text("Facturas"),
            onTap: () {
              widget.delegated.onInvoiced(context);
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
              widget.delegated.onSettings(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("Acerca De"),
            onTap: () {
              widget.delegated.onAbout(context);
            },
          ),
        ],
      ),
    );
  }

}
