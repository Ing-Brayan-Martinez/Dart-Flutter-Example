import 'package:dart_flutter_example/controllers/delegated/drawer/data_drawer_delegate.dart';
import 'package:dart_flutter_example/controllers/observer/observer.dart';
import 'package:dart_flutter_example/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/controllers/observer/observer_singlenton.dart';
import 'package:dart_flutter_example/controllers/strategy/create_customer/reload_customer_create.dart';
import 'package:dart_flutter_example/domain/event/create_event.dart';
import 'package:dart_flutter_example/screens/customer/customer_create_screen.dart';
import 'package:dart_flutter_example/screens/data/component/customer_list.dart';
import 'package:dart_flutter_example/screens/data/component/invoice_list.dart';
import 'package:dart_flutter_example/screens/invoice/invoice_create_screen.dart';
import 'package:dart_flutter_example/screens/share/application_drawer.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  static const routeName = '/data';

  const DataScreen({
    Key? key,
  }) : super(key: key);

  @override
  DataScreenState createState() => DataScreenState();
}

class DataScreenState extends State<DataScreen>
    with SingleTickerProviderStateMixin {
  late Observer? _observer;
  late TabController _controller;
  int? _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        TabController(length: 2, vsync: this, initialIndex: _currentIndex!);
    _controller.animateTo(_currentIndex!);

    _observer = SinglentonObserver.get();
    _observer?.subscribe((ObserverAction event) {
      switch (event.type) {
        case ObserverEvent.EVENT_TAB_CUSTOMER:
          _currentIndex = event.value;
          _controller.animateTo(_currentIndex!);
          break;

        case ObserverEvent.EVENT_TAB_INVOICE:
          _currentIndex = event.value;
          _controller.animateTo(_currentIndex!);
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
    _currentIndex = ModalRoute.of(context)?.settings.arguments as int?;
    _controller.animateTo(_currentIndex!);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sci Fi Space'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (String val) {
                if (val == CreateEvent.EVENT_INVOICE) {
                  Navigator.pushNamed(context, CreateInvoiceScreen.routeName);
                }

                if (val == CreateEvent.EVENT_CUSTOMER) {
                  Navigator.pushNamed(context, CreateCustomerScreen.routeName,
                      arguments: ReloadCustomerCreate.DATA_STRATEGY);
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: CreateEvent.EVENT_CUSTOMER,
                  child: Text("Crear Cliente"),
                ),
                const PopupMenuItem(
                  value: CreateEvent.EVENT_INVOICE,
                  child: Text("Crear Factura"),
                ),
              ],
            )
          ],
          bottom: TabBar(
            controller: DefaultTabController.of(context),
            tabs: const <Widget>[
              Tab(text: 'Clientes'),
              Tab(text: 'Facturas'),
            ],
          ),
        ),
        body: TabBarView(
          controller: DefaultTabController.of(context),
          children: const <Widget>[
            CustomerList(),
            InvoiceList(),
          ],
        ),
        drawer: ApplicationDrawer(delegate: DataDrawerDelegated()),
      ),
    );
  }
}
