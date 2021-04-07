import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:dart_flutter_example/controllers/strategy/create_customer/reload_customer_create.dart';
import 'package:dart_flutter_example/screens/customer/customer_create_screen.dart';
import 'package:dart_flutter_example/screens/invoice/invoice_create_screen.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  FloatingButton({Key key}) : super(key: key);

  @override
  FloatingButtonState createState() => FloatingButtonState();
}

class FloatingButtonState extends State<FloatingButton>
    with SingleTickerProviderStateMixin {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
        fabButtons: <Widget>[
          this._client(),
          this._invoice(),
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close //To principal button
        );
  }

  Widget _client() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btnClient",
        tooltip: 'Crear clientes.',
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.pushNamed(context, CreateCustomerScreen.routeName,
              arguments: ReloadCustomerCreate.HOME_STRATEGY);
        },
      ),
    );
  }

  Widget _invoice() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btnInvoice",
        tooltip: 'Crear facturas.',
        child: Icon(Icons.business),
        onPressed: () {
          Navigator.pushNamed(context, CreateInvoiceScreen.routeName);
        },
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
  }
}
