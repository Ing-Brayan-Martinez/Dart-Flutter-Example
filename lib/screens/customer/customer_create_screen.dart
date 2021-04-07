import 'package:dart_flutter_example/bloc/customer_bloc.dart';
import 'package:dart_flutter_example/controllers/strategy/create_customer/reload_customer_create.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:flutter/material.dart';

class CreateCustomerScreen extends StatefulWidget {
  static const routeName = '/customer/create';

  GlobalKey<FormState> _formKey;
  Customer _customer;
  String _strategyFlag;
  CustomerBloc _bloc;

  CreateCustomerScreen({Key key}) {
    _formKey = new GlobalKey<FormState>();
    _customer = new Customer();
    _customer.status = "Y";
    _strategyFlag = "";
    _bloc = new CustomerBloc();
  }

  @override
  _CreateCustomerScreenState createState() => _CreateCustomerScreenState();
}

class _CreateCustomerScreenState extends State<CreateCustomerScreen> {
  Future<Null> _showDialog(BuildContext context) async {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Se ha guardado el Cliente.")));
    return Future.delayed(new Duration(seconds: 1), () => null);
  }

  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context).settings.arguments;
    if (arg != null) {
      widget._strategyFlag = arg;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Cliente"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(builder: (context) {
            return Form(
              key: widget._formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.grid_on),
                        labelText: "Codigo",
                        hintText: "eg. 01010102"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor ingrese el codigo correctamente.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      widget._customer.code = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Nombre",
                        hintText: "eg. Beco C.A"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor ingrese el nombre correctamente.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      widget._customer.name = val.toUpperCase();
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.directions),
                        labelText: "Direccion",
                        hintText: "eg. Valencia, AV Bolivar, Casa #9091"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor ingrese la direccion correctamente.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      widget._customer.adress = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: "Correo",
                        hintText: "eg. ejemplo@mail.com"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor ingrese el correo correctamente.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      widget._customer.mail = val;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.phone),
                        labelText: "Telefono",
                        hintText: "eg. +584263214569"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Por favor ingrese el telefono correctamente.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      widget._customer.phone = val;
                    },
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: RaisedButton(
                        child: Text("Crear"),
                        onPressed: () {
                          final form = widget._formKey.currentState;
                          if (form.validate()) {
                            ///Salvar la entidad.
                            form.save();

                            /// Guardar entidad en el Back End
                            widget._bloc.add(widget._customer);

                            ///Mostrar el dialogo de confirmacion.
                            _showDialog(context).then((val) {
                              final ReloadCustomerCreate _satrategy =
                                  new ReloadCustomerCreate(context);

                              switch (widget._strategyFlag) {
                                case ReloadCustomerCreate.HOME_STRATEGY:
                                  _satrategy
                                      .setReloadCustomerFromHome()
                                      .reload();
                                  break;

                                case ReloadCustomerCreate.DATA_STRATEGY:
                                  _satrategy
                                      .setReloadCustomerFromData()
                                      .reload();
                                  break;
                              }
                            });
                          }
                        }),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
