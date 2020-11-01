import 'package:dart_flutter_example/behavior/delegated/drawer/home_drawer_delegate.dart';
import 'package:dart_flutter_example/behavior/delegated/search/custom_search_delegate.dart';
import 'package:dart_flutter_example/bloc/home_bloc.dart';
import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:dart_flutter_example/widgets/drawer/application_drawer.dart';
import 'package:dart_flutter_example/widgets/floating/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  HomeBloc _bloc;

  HomeScreen({Key key}) {
    _bloc = Modular.get<HomeBloc>();
    _bloc.getHomes();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 25),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: StreamBuilder<List<Home>>(
                stream: this._bloc.homeStream,
                // ignore: missing_return
                builder: (context, AsyncSnapshot<List<Home>> snapshot) {
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
              )),
            ],
          ),
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
