
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/observer/observer.dart';
import 'package:prueba_flutter/observer/observer_action.dart';
import 'package:prueba_flutter/observer/observer_event.dart';
import 'package:prueba_flutter/observer/observer_singlenton.dart';
import 'package:prueba_flutter/views/customer/strategy/reload_customer.dart';
import 'package:prueba_flutter/views/customer/create_customer_screen.dart';
import 'package:prueba_flutter/views/data/frame/event/create_event.dart';
import 'package:prueba_flutter/views/data/lists/customer_list.dart';
import 'package:prueba_flutter/views/data/lists/invoice_list.dart';
import 'package:prueba_flutter/views/drawer//drawer.dart';
import 'package:prueba_flutter/views/drawer/delegated/data_delegated.dart';
import 'package:prueba_flutter/views/invoice/create_invoice_screen.dart';

class DataFrame extends StatefulWidget {

  DataFrame({Key key,}) : super(key: key);

  @override
  DataFrameState createState() => DataFrameState();

}

class DataFrameState extends State<DataFrame> with SingleTickerProviderStateMixin {

  Observer _observer;
  TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    _controller.animateTo(_currentIndex);

    _observer = SinglentonObserver.get();
    _observer.subscribe((ObserverAction event) {

      switch(event.type) {

        case ObserverEvent.EVENT_TAB_CUSTOMER:
          _currentIndex = event.value;
          _controller.animateTo(_currentIndex);
          break;

        case ObserverEvent.EVENT_TAB_INVOICE:
          _currentIndex = event.value;
          _controller.animateTo(_currentIndex);
          break;

        default:
          print("No es tu caso...");

      }

    });

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _currentIndex = ModalRoute.of(context).settings.arguments;
    _controller.animateTo(_currentIndex);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sci Fi Space'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (String val) {

                if (val == CreateEvent.EVENT_INVOICE) {
                  Navigator.pushNamed(context, CreateInvoiceScreen.routeName);
                }

                if (val == CreateEvent.EVENT_CUSTOMER) {
                  Navigator.pushNamed(context, CreateCustomeScreen.routeName, arguments: Optional.of(ReloadCustomer.DATA_STRATEGY));
                }

              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: CreateEvent.EVENT_CUSTOMER,
                  child: Text("Crear Cliente"),
                ),
                PopupMenuItem(
                  value: CreateEvent.EVENT_INVOICE,
                  child: Text("Crear Factura"),
                ),
              ],
            )
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: <Widget>[
              Tab(text: 'Clientes'),
              Tab(text: 'Facturas'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            CustomerList(),
            InvoiceList(),
          ],
        ),
        drawer: AppDrawer(delegated: DataDelegated()),
      ),
    );

  }

}

