import 'package:flutter/material.dart';

class CreateInvoiceScreen extends StatefulWidget {
  static const routeName = '/invoice/create';

  const CreateInvoiceScreen({Key? key}) : super(key: key);

  @override
  _CreateInvoiceScreenState createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  //String _code = '';
  //String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Factura"),
        actions: const <Widget>[],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 150,
          child: Column(
            children: <Widget>[
              SimpleDialogOption(
                  child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Codigo', hintText: 'eg. 01010102'),
                onChanged: (value) {
                  //_code = value;
                },
              )),
              SimpleDialogOption(
                  child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Nombre', hintText: 'eg. Beco C.A'),
                onChanged: (value) {
                  //_name = value;
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
