import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:prueba_flutter/customer/views/create_customer_screen.dart';
import 'package:prueba_flutter/legacy/strategy/create/reload_customer_create.dart';
import 'package:prueba_flutter/invoice/views/create_invoice_screen.dart';


class FloatingButton extends StatefulWidget {

  FloatingButton({Key key}) : super(key: key);

  @override
  FloatingButtonState createState() => FloatingButtonState();

}

class FloatingButtonState extends State<FloatingButton> with SingleTickerProviderStateMixin {

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget _client() {

    return Container(
      child: FloatingActionButton(
        heroTag: "btnClient",
        tooltip: 'Crear clientes.',
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.pushNamed(context, CreateCustomeScreen.routeName,
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
  Widget build(BuildContext context) {

      return AnimatedFloatingActionButton(
        //Fab list
          fabButtons: <Widget>[
            _client(),
            _invoice(),
          ],
          colorStartAnimation: Colors.blue,
          colorEndAnimation: Colors.red,
          animatedIconData: AnimatedIcons.menu_close //To principal button
      );
  }


}