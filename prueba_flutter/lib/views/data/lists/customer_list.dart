import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/http/customer_http.dart';
import 'package:prueba_flutter/observer/observer.dart';
import 'package:prueba_flutter/observer/observer_action.dart';
import 'package:prueba_flutter/observer/observer_event.dart';
import 'package:prueba_flutter/observer/observer_singlenton.dart';
import 'package:prueba_flutter/views/customer/see_customer_screen.dart';
import 'package:prueba_flutter/views/customer/update_customer_screen.dart';
import 'package:prueba_flutter/views/data/lists/event/customer_item_event.dart';
import 'package:prueba_flutter/views/data/model/filter_customer_model.dart';

class CustomerList extends StatefulWidget {

  CustomerList({Key key}) : super(key: key);

  @override
  CustomerListState createState() => CustomerListState();

}

class CustomerListState extends State<CustomerList> {

  CustomerHttp _repository;
  List<Customer> _customers;
  Observer _observer;
  bool _visible = true;

  Future<String> _asyncInputDialog(BuildContext context) async {

    final FilterCustomerModel model = new FilterCustomerModel();

    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Coloque los datos para filtrar.'),
          content: SingleChildScrollView(
            child: Container(
              height: 150,
              child: Column(
                children: <Widget>[
                 TextField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'Codigo', hintText: 'eg. 010203'),
                    onChanged: (value) {
                      model.code = value;
                    },
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'Nombre', hintText: 'eg. Beco C.A'),
                    onChanged: (value) {
                      model.name = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
//                this._repository.findCustomer(model).then((list) {
//                  this.setState(() => this._customers = list);
//                  _observer.notify(new ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
//                  Navigator.of(context).pop();
//                });
              },
            ),
          ],
        );
      },
    );
  }

  void _loadList() {
    this._repository.findAllList()
        .then((list) => setState(() => this._customers = list));
  }

  @override
  void initState() {
    super.initState();
    _repository = new CustomerHttp();
    _customers = new List();

    _observer = SinglentonObserver.get();
    _observer.subscribe((ObserverAction event) {
      if (event.type == ObserverEvent.EVENT_LOAD_LIST_CUSTOMER) {
        _loadList();
      }
    });
    
    //Initial loader
    _loadList();
    
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.yellowAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.refresh), //`Icon` to display
                  label: Text('Recargar'), //`Text` to display
                  onPressed: () {
                    _loadList();
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.filter_list), //`Icon` to display
                  label: Text('Filtrar'), //`Text` to display
                  onPressed: () {
                    //_asyncInputDialog(context);
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: this._customers.map((data) {

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/astronauta.jpg'),
                  ),
                  title: Text(data.getName().orElse("")),
                  subtitle: Text(data.getMail().orElse("")),
                  trailing: PopupMenuButton(
                    onSelected: (CustomerItemEvent val) {

                      switch(val.type) {

                        case CustomerItemEvent.EVENT_SEE:
                          Navigator.pushNamed(context, SeeCustomeScreen.routeName);
                          break;

                        case CustomerItemEvent.EVENT_UPDATE:
                          Navigator.pushNamed(context, UpdateCustomeScreen.routeName,
                              arguments: Optional.ofNullable(val.customer));
                          break;

                        case CustomerItemEvent.EVENT_DELETE:
                          final Customer result = val.customer;
                          result.delete();
                          this._customers.removeWhere((val) => val == result);
                          this._repository.findAllList()
                              .then((list) => setState(() => this._customers = list));
                          print("Se ha eliminado a: ${result.toString()}");
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
                    Navigator.pushNamed(context, SeeCustomeScreen.routeName);
                  },
                );

              }).toList(),
            ),
          )
        ],
      ),
    );
  }


}