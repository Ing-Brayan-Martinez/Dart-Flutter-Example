
import 'package:flutter/material.dart';
import 'package:prueba_flutter/customer/views/create_customer_screen.dart';
import 'package:prueba_flutter/dashboard/views/lists/customer_list.dart';
import 'package:prueba_flutter/dashboard/views/lists/invoice_list.dart';
import 'package:prueba_flutter/legacy/observer/observer.dart';
import 'package:prueba_flutter/legacy/observer/observer_action.dart';
import 'package:prueba_flutter/legacy/observer/observer_event.dart';
import 'package:prueba_flutter/legacy/observer/observer_singlenton.dart';
import 'package:prueba_flutter/legacy/strategy/create/reload_customer_create.dart';
import 'package:prueba_flutter/invoice/views/create_invoice_screen.dart';
import 'package:prueba_flutter/shared/views/drawer/delegated/data_delegated.dart';
import 'package:prueba_flutter/shared/views/drawer/drawer.dart';

import 'event/create_event.dart';

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
                  Navigator.pushNamed(context, CreateCustomeScreen.routeName,
                      arguments: ReloadCustomerCreate.DATA_STRATEGY);
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

