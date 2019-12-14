import 'package:flutter/material.dart';
import 'package:prueba_flutter/home/bloc/home_bloc.dart';
import 'package:prueba_flutter/home/model/home.dart';

class HomeList extends StatefulWidget {

  HomeList({Key key}) : super(key: key);

  @override
  HomeListState createState() => HomeListState();

}

class HomeListState extends State<HomeList> {

  final HomeBloc _bloc = new HomeBloc();

  @override
  void initState() {
    super.initState();
    this._bloc.getHomes();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
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
            )
          ),
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

  @override
  void dispose() {
    super.dispose();
    this._bloc.dispose();
  }

}


