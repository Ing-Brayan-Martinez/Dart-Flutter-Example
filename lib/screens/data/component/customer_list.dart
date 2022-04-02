import 'package:dart_flutter_example/bloc/customer_bloc.dart';
import 'package:dart_flutter_example/controllers/strategy/update_customer/reload_customer_update.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dart_flutter_example/domain/event/customer_item_event.dart';
import 'package:dart_flutter_example/domain/event/update_customer_event.dart';
import 'package:flutter/material.dart';

import '../../customer/customer_see_screen.dart';
import '../../customer/customer_update_screen.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  CustomerListState createState() => CustomerListState();
}

class CustomerListState extends State<CustomerList> {
  final CustomerBloc _bloc = CustomerBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //color: Colors.yellowAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton.icon(
                icon: const Icon(Icons.refresh), //`Icon` to display
                label: const Text('Recargar'), //`Text` to display
                onPressed: () {
                  _bloc.getCustomers();
                },
              ),
              FlatButton.icon(
                icon: const Icon(Icons.filter_list), //`Icon` to display
                label: const Text('Filtrar'), //`Text` to display
                onPressed: () {
                  _showFilterDialog(context);
                },
              ),
            ],
          ),
        ),
        Expanded(
            child: StreamBuilder<List<Customer>>(
          stream: _bloc.customerListStream,
          builder: (context, AsyncSnapshot<List<Customer>> snapshot) {
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
        ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
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
  Widget _buildDataWidget(BuildContext context, List<Customer> entity) {
    return ListView(
      children: entity.map((Customer data) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/astronauta.jpg'),
          ),
          title: Text(data.name!),
          subtitle: Text(data.mail!),
          trailing: PopupMenuButton(
            onSelected: (CustomerItemEvent val) {
              switch (val.type) {
                case CustomerItemEvent.EVENT_SEE:
                  Navigator.pushNamed(context, SeeCustomerScreen.routeName,
                      arguments: val.customer);
                  break;

                case CustomerItemEvent.EVENT_UPDATE:
                  Navigator.pushNamed(context, UpdateCustomerScreen.routeName,
                      arguments: UpdateCustomerEvent(
                          val.customer, ReloadCustomerUpdate.DATA_STRATEGY));
                  break;

                case CustomerItemEvent.EVENT_DELETE:
                  //_showDeleteDialog(context, val.customer);
                  break;
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: CustomerItemEvent(CustomerItemEvent.EVENT_SEE, data),
                child: const Text("Ver"),
              ),
              PopupMenuItem(
                value: CustomerItemEvent(CustomerItemEvent.EVENT_DELETE, data),
                child: const Text("Eliminar"),
              ),
              PopupMenuItem(
                value: CustomerItemEvent(CustomerItemEvent.EVENT_UPDATE, data),
                child: const Text("Actualizar"),
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, SeeCustomerScreen.routeName,
                arguments: data);
          },
        );
      }).toList(),
    );
  }

  /// Para mostrar la confirmacion de
  /// una accion.
  Future<void> _showConfirmDialog(
      BuildContext context, String messenger) async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(messenger)));
    return Future.delayed(const Duration(seconds: 1), () => null);
  }

  /// Este dialogo es el encargado de confirmar
  /// la eliminacion de un cliente.
  Future<Future<String?>> _showDeleteDialog(
      BuildContext context, Customer customer) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Esta seguro que desea eliminar este cliente.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            FlatButton(
              child: const Text('Ok'),
              onPressed: () async {
                /// borrar en la base de datos.
                //this._repository.delete([customer]);

                /// borrar en la UI.
                //this.setState(() => this._customers.removeWhere((val) => val == customer));

                /// cerrar el dialog
                Navigator.of(dialogContext).pop();

                await _showConfirmDialog(
                    context, "Se ha eliminado un cliente.");
              },
            ),
          ],
        );
      },
    );
  }

  /// Este dialogo es el encargado
  /// de filtrar
  Future<Future<String?>> _showFilterDialog(BuildContext context) async {
    int? _currVal = 1;
    String _currText = "";

    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Coloque los datos para filtrarjjjjjjjj.'),
          content: SingleChildScrollView(
            child: SizedBox(
              height: 200,
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    title: const Text("Codigo"),
                    groupValue: _currVal,
                    value: 1,
                    onChanged: (val) {
                      setState(() => _currVal = val as int?);
                    },
                  ),
                  RadioListTile(
                    title: const Text("Nombre"),
                    groupValue: _currVal,
                    value: 2,
                    onChanged: (val) {
                      setState(() => _currVal = val as int?);
                    },
                  ),
                  TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                        labelText: 'Valor', hintText: 'eg. 010203'),
                    onChanged: (value) {
                      _currText = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Ok'),
              onPressed: () {
                if (_currVal == 1) {
                  _bloc.getCustomersByCode(_currText);
                  Navigator.of(context).pop();
                }

                if (_currVal == 2) {
                  _bloc.getCustomersByName(_currText.toUpperCase());
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
