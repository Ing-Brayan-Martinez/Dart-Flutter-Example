import 'package:flutter/material.dart';
import 'package:prueba_flutter/behavior/strategy/update_customer/reload_customer_update.dart';
import 'package:prueba_flutter/bloc/customer_bloc.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/screens/see_customer_screen.dart';
import 'package:prueba_flutter/screens/update_customer_screen.dart';
import 'package:prueba_flutter/shared/event/customer_item_event.dart';
import 'package:prueba_flutter/shared/event/update_customer_event.dart';



class CustomerList extends StatefulWidget {

  CustomerList({Key key}) : super(key: key);

  @override
  CustomerListState createState() => new CustomerListState();

}

class CustomerListState extends State<CustomerList> {

  final CustomerBloc _bloc = new CustomerBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getCustomers();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            //color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.refresh), //`Icon` to display
                  label: Text('Recargar'), //`Text` to display
                  onPressed: () {
                    this._bloc.getCustomers();
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.filter_list), //`Icon` to display
                  label: Text('Filtrar'), //`Text` to display
                  onPressed: () {
                    this._showFilterDialog(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Customer>>(
              stream: this._bloc.customerListStream,
              // ignore: missing_return
              builder: (context, AsyncSnapshot<List<Customer>> snapshot) {
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
          )
        ],
      ),
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
  Widget _buildDataWidget(BuildContext context, List<Customer> entity) {
    return ListView(
      children: entity.map((Customer data) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/astronauta.jpg'),
          ),
          title: Text(data.name),
          subtitle: Text(data.mail),
          trailing: PopupMenuButton(
            onSelected: (CustomerItemEvent val) {

              switch(val.type) {

                case CustomerItemEvent.EVENT_SEE:
                  Navigator.pushNamed(context, SeeCustomerScreen.routeName,
                      arguments: val.customer);
                  break;

                case CustomerItemEvent.EVENT_UPDATE:
                  Navigator.pushNamed(context, UpdateCustomerScreen.routeName,
                      arguments: new UpdateCustomerEvent(val.customer, ReloadCustomerUpdate.DATA_STRATEGY));
                  break;

                case CustomerItemEvent.EVENT_DELETE:
                  //_showDeleteDialog(context, val.customer);
                  break;

              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: CustomerItemEvent(CustomerItemEvent.EVENT_SEE, data),
                child: Text("Ver"),
              ),
              PopupMenuItem(
                value: CustomerItemEvent(CustomerItemEvent.EVENT_DELETE, data),
                child: Text("Eliminar"),
              ),
              PopupMenuItem(
                value: CustomerItemEvent(CustomerItemEvent.EVENT_UPDATE, data),
                child: Text("Actualizar"),
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
  Future<Null> _showConfirmDialog(BuildContext context, String messenger) async {
    Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text(messenger)
        )
    );
    return Future.delayed(Duration(seconds: 1), () => null);
  }

  /// Este dialogo es el encargado de confirmar
  /// la eliminacion de un cliente.
  Future<String> _showDeleteDialog(BuildContext context, Customer customer) async {

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Esta seguro que desea eliminar este cliente.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () async {

                /// borrar en la base de datos.
                //this._repository.delete([customer]);

                /// borrar en la UI.
                //this.setState(() => this._customers.removeWhere((val) => val == customer));

                /// cerrar el dialog
                Navigator.of(dialogContext).pop();

                await _showConfirmDialog(context, "Se ha eliminado un cliente.");
              },
            ),
          ],
        );
      },
    );
  }

  /// Este dialogo es el encargado
  /// de filtrar
  Future<String> _showFilterDialog(BuildContext context) async {
    int _currVal = 1;
    String _currText = "";

    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Coloque los datos para filtrar.'),
          content: SingleChildScrollView(
            child: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    title: Text("Codigo"),
                    groupValue: _currVal,
                    value: 1,
                    onChanged: (val) {
                      this.setState(() => _currVal = val);
                    },
                  ),
                  RadioListTile(
                    title: Text("Nombre"),
                    groupValue: _currVal,
                    value: 2,
                    onChanged: (val) {
                      this.setState(() => _currVal = val);
                    },
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'Valor', hintText: 'eg. 010203'),
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
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {

                if (_currVal == 1) {
                  this._bloc.getCustomersByCode(_currText);
                  Navigator.of(context).pop();
                }

                if (_currVal == 2) {
                  this._bloc.getCustomersByName(_currText.toUpperCase());
                  Navigator.of(context).pop();
                }

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
