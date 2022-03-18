import 'package:dart_flutter_example/bloc/invoice_bloc.dart';
import 'package:dart_flutter_example/domain/entity/invoice.dart';
import 'package:dart_flutter_example/domain/event/invoice_item_event.dart';
import 'package:flutter/material.dart';


class InvoiceList extends StatefulWidget {

  const InvoiceList({Key? key}) : super(key: key);

  @override
  InvoiceListState createState() => InvoiceListState();

}

class InvoiceListState extends State<InvoiceList> {

  final InvoiceBloc _bloc = InvoiceBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getInvoices();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton.icon(
              icon: const Icon(Icons.refresh), //`Icon` to display
              label: const Text('Recargar'), //`Text` to display
              onPressed: () {
                _bloc.getInvoices();
              },
            ),
            FlatButton.icon(
              icon: const Icon(Icons.filter_list), //`Icon` to display
              label: const Text('Filtrar'), //`Text` to display
              onPressed: () {
                _asyncInputDialog(context);
              },
            ),
          ],
        ),
        Expanded(
          child: StreamBuilder<List<Invoice>>(
            stream: _bloc.invoicesStream,
            builder: (context, AsyncSnapshot<List<Invoice>> snapshot) {
              /// caso de uso para una swich expretions
              Widget result = _buildLoadingWidget(context);

              ///Si hay stream con data
              if (snapshot.hasData && snapshot.data != null) {
                result = _buildDataWidget(context, snapshot.data!);
              }

              ///Si hay un error
              if (snapshot.hasError) {
                result = _buildErrorWidget(context, snapshot.error!);
              }

              ///Si no hay data
              if (!snapshot.hasData) {
                result = _buildLoadingWidget(context);
              }

              return result;
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
    return const Center();
  }

  /// Esto es para mostrar algo en
  /// el caso que se produsca un error
  /// al momento de consultar la data.
  Widget _buildErrorWidget(BuildContext context, Object object) {
    return const Center();
  }

  /// Esto es para mostrar la data
  /// que fue consultada
  Widget _buildDataWidget(BuildContext context, List<Invoice> entity) {
    return ListView(

      children: entity.map((data) {

        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.business),
          ),
          title: Text(data.code!),
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
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: InvoiceItemEvent(InvoiceItemEvent.EVENT_SEE, data),
                child: const Text("Ver"),
              ),
              PopupMenuItem(
                value: InvoiceItemEvent(InvoiceItemEvent.EVENT_DELETE, data),
                child: const Text("Eliminar"),
              ),
              PopupMenuItem(
                value: InvoiceItemEvent(InvoiceItemEvent.EVENT_UPDATE, data),
                child: const Text("Actualizar"),
              ),
            ],
          ),
        );

      }).toList(),

    );
  }

  Future<Future<String?>> _asyncInputDialog(BuildContext context) async {
    String _code = '';
    String _name = '';
    String _desde = '';
    String _hasta = '';

    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Coloque los datos para filtrar.'),
          content: SingleChildScrollView(
            child: SizedBox(
              height: 400,
              child: Column(
                children: <Widget>[
                  SimpleDialogOption(
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(labelText: 'Codigo', hintText: 'eg. 01010102'),
                        onChanged: (value) {
                          _code = value;
                        },
                      )
                  ),
                  SimpleDialogOption(
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(labelText: 'Cliente', hintText: 'eg. Beco C.A'),
                        onChanged: (value) {
                          _name = value;
                        },
                      )
                  ),
                  SimpleDialogOption(
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(labelText: 'Desde', hintText: 'eg. 2019-10-05'),
                        onChanged: (value) {
                          _desde = value;
                        },
                      )
                  ),
                  SimpleDialogOption(
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(labelText: 'Hasta', hintText: 'eg. 2019-10-05'),
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
              child: const Text('Ok'),
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
    _bloc.dispose();
  }

}
