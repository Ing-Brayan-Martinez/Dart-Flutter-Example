import 'package:flutter/material.dart';
import 'package:prueba_flutter/legacy/domain/invoice.dart';
import 'package:prueba_flutter/legacy/repository/invoice_repository.dart';
import 'package:prueba_flutter/views/data/lists/event/invoice_item_event.dart';


class InvoiceList extends StatefulWidget {

  InvoiceList({Key key}) : super(key: key);

  @override
  InvoiceListState createState() => InvoiceListState();

}

class InvoiceListState extends State<InvoiceList> {

  final InvoiceRepository repository = new InvoiceRepository();
  List<Invoice> invoices = new List();

  String _code = '';
  String _name = '';
  String _desde = '';
  String _hasta = '';

  Future<String> _asyncInputDialog(BuildContext context) async {

    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Coloque los datos para filtrar.'),
          content: SingleChildScrollView(
            child: Container(
              height: 400,
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
                        decoration: InputDecoration(labelText: 'Cliente', hintText: 'eg. Beco C.A'),
                        onChanged: (value) {
                          _name = value;
                        },
                      )
                  ),
                  SimpleDialogOption(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(labelText: 'Desde', hintText: 'eg. 2019-10-05'),
                        onChanged: (value) {
                          _desde = value;
                        },
                      )
                  ),
                  SimpleDialogOption(
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(labelText: 'Hasta', hintText: 'eg. 2019-10-05'),
                        onChanged: (value) {
                          _hasta = value;
                        },
                      )
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void reload() {
    this.repository.findAllList()
        .then((list) => setState(() => this.invoices = list));
  }

  @override
  void initState() {
    super.initState();
    reload();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.refresh), //`Icon` to display
                label: Text('Recargar'), //`Text` to display
                onPressed: () {
                  reload();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.filter_list), //`Icon` to display
                label: Text('Filtrar'), //`Text` to display
                onPressed: () {
                  _asyncInputDialog(context);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(

            children: this.invoices.map((data) {

              return ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.business),
                ),
                title: Text(data.getCode().orElse("")),
                subtitle: Text("\$ ${data.getBaseAmt().orElse(0.00).toString()}"),
                trailing: PopupMenuButton(
                  onSelected: (InvoiceItemEvent val) {

                    switch(val.type) {

                      case InvoiceItemEvent.EVENT_SEE:

                        break;

                      case InvoiceItemEvent.EVENT_UPDATE:

                        break;

                      case InvoiceItemEvent.EVENT_DELETE:
                        final Invoice result = val.invoice;
                        result.delete();
                        this.invoices.removeWhere((val) => val == result);
                        this.repository.findAllList()
                            .then((list) => setState(() => this.invoices = list));
                        print("Se ha eliminado a: ${result.toString()}");
                        break;
                    }

                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(
                      value: InvoiceItemEvent(InvoiceItemEvent.EVENT_SEE, data),
                      child: Text("Ver"),
                    ),
                    PopupMenuItem(
                      value: InvoiceItemEvent(InvoiceItemEvent.EVENT_DELETE, data),
                      child: Text("Eliminar"),
                    ),
                    PopupMenuItem(
                      value: InvoiceItemEvent(InvoiceItemEvent.EVENT_UPDATE, data),
                      child: Text("Actualizar"),
                    ),
                  ],
                ),
              );

            }).toList(),

          ),
        ),
      ],
    );
  }

}

