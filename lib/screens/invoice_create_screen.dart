
import 'package:flutter/material.dart';

class CreateInvoiceScreen extends StatelessWidget {
  static const routeName = '/invoice/create';

  String _code = '';
  String _name = '';

  CreateInvoiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Crear Factura"),
          actions: <Widget>[

          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                SimpleDialogOption(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'Codigo', hintText: 'eg. 01010102'),
                      onChanged: (value) {
                        _code = value;
                      },
                    )
                ),
                SimpleDialogOption(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'Nombre', hintText: 'eg. Beco C.A'),
                      onChanged: (value) {
                        _name = value;
                      },
                    )
                ),
              ],
            ),
          ),
        ),
    );
  }


}
