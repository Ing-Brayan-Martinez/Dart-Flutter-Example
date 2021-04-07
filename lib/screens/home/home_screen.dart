import 'dart:ui';

import 'package:dart_flutter_example/bloc/home_bloc.dart';
import 'package:dart_flutter_example/controllers/delegated/drawer/home_drawer_delegate.dart';
import 'package:dart_flutter_example/controllers/delegated/search/custom_search_delegate.dart';
import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:dart_flutter_example/screens/share/application_drawer.dart';
import 'package:dart_flutter_example/screens/share/floating_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = new HomeBloc()..getHomes();

    return Scaffold(
        appBar: AppBar(
          title: Text("Sci Fi Space"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hola',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
                child: StreamBuilder<List<Home>>(
              stream: bloc.homeStream,
              // ignore: missing_return
              builder: (context, AsyncSnapshot<List<Home>> snapshot) {
                /// caso de uso para una swich expretions

                ///Si hay stream con data
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data.length > 0) {
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
            )),
          ],
        ),
        floatingActionButton: FloatingButton(),
        drawer: ApplicationDrawer(delegate: HomeDrawerDelegate()));
  }

  /// Esto es para mostrar una barra
  /// de progreso mientras se consulta
  /// la data.
  Widget _buildLoadingWidget(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  /// Esto es para mostrar algo en
  /// el caso que se produsca un error
  /// al momento de consultar la data.
  Widget _buildErrorWidget(BuildContext context, Object object) {
    return Center(child: Text(object.toString()));
  }

  /// Esto es para mostrar la data
  /// que fue consultada
  Widget _buildDataWidget(BuildContext context, List<Home> entity) {
    return ListView(
      children: entity.map((data) {
        return Card(
          child: new Column(
            children: <Widget>[
              Image.asset(data.image),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text(data.title),
                subtitle: Text(data.subTitle),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
