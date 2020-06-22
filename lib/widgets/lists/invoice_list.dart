import 'package:flutter/material.dart';
import 'package:prueba_flutter/bloc/invoice_bloc.dart';
import 'package:prueba_flutter/domain/entity/invoice.dart';
import 'package:prueba_flutter/domain/event/invoice_item_event.dart';



class InvoiceList extends StatefulWidget {

  InvoiceList({Key key}) : super(key: key);

  @override
  InvoiceListState createState() => InvoiceListState();

}

class InvoiceListState extends State<InvoiceList> {

  final InvoiceBloc _bloc = new InvoiceBloc();

  @override
  void initState() {
    super.initState();
    this._bloc.getInvoices();
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
                  this._bloc.getInvoices();
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
          child: StreamBuilder<List<Invoice>>(
            stream: this._bloc.invoicesStream,
            // ignore: missing_return
            builder: (context, AsyncSnapshot<List<Invoice>> snapshot) {
              /// caso de uso para una swich expretions

              ///Si hay stream con data
              if (snapshot.hasData && snapshot.data != null && snapshot.data.length > 0) {
                return _buildDataWidget(context, snapshot.data);
              }

              ///Si hay un error
              if (snapshot.hasError) {
                return _buildErrorWidget(context, snapshot.error);
              }

              ///Si no hay data
              if (!snapshot.hasData) {
                return _buildLoadingWidget(context);
              }

            },
          )
        ),
      ],
    );
  }

  /// Esto es para mostrar una barra
  /// de progreso mientras se consulta
  /// la data.
  Widget _buildLoadingWidget(BuildContext context) {
    return Center();
  }

  /// Esto es para mostrar algo en
  /// el caso que se produsca un error
  /// al momento de consultar la data.
  Widget _buildErrorWidget(BuildContext context, Object object) {
    return Center();
  }

  /// Esto es para mostrar la data
  /// que fue consultada
  Widget _buildDataWidget(BuildContext context, List<Invoice> entity) {
    return ListView(

      children: entity.map((data) {

        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.business),
          ),
          title: Text(data.code),
          subtitle: Text("\$ ${data.baseAmt}"),
          trailing: PopupMenuButton(
            onSelected: (InvoiceItemEvent val) {

              switch(val.type) {

                case InvoiceItemEvent.EVENT_SEE:

                  break;

                case InvoiceItemEvent.EVENT_UPDATE:

                  break;

                case InvoiceItemEvent.EVENT_DELETE:
                  final Invoice result = val.invoice;
//                  result.delete();
//                  this.invoices.removeWhere((val) => val == result);
//                  this.repository.findAllList()
//                      .then((list) => setState(() => this.invoices = list));
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

    );
  }

  Future<String> _asyncInputDialog(BuildContext context) async {
    String _code = '';
    String _name = '';
    String _desde = '';
    String _hasta = '';

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

  @override
  void dispose() {
    super.dispose();
    this._bloc.dispose();
  }

}

