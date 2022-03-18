import 'package:dart_flutter_example/bloc/customer_bloc.dart';
import 'package:dart_flutter_example/controllers/strategy/create_customer/reload_customer_create.dart';
import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:flutter/material.dart';

class CreateCustomerForm extends StatefulWidget {

  const CreateCustomerForm({
    Key? key,
  }) : super(key: key);

  @override
  CreateCustomerFormState createState() => CreateCustomerFormState();
}

class CreateCustomerFormState extends State<CreateCustomerForm> {

  late GlobalKey<FormState> _formKey;
  late Customer _customer;
  late String _strategyFlag;
  late CustomerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _customer = Customer();
    _customer.status = "Y";
    _strategyFlag = "";
    _bloc = CustomerBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context)?.settings.arguments as String;
    if (arg != null) {
      _strategyFlag = arg;
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(builder: (context) {
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.grid_on),
                      labelText: "Codigo",
                      hintText: "eg. 01010102"),
                  validator: (value) {
                      return "Por favor ingrese el codigo correctamente.";
                  },
                  onSaved: (val) {
                    _customer.code = val;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Nombre",
                      hintText: "eg. Beco C.A"),
                  validator: (value) {
                      return "Por favor ingrese el nombre correctamente.";
                  },
                  onSaved: (val) {
                    _customer.name = val?.toUpperCase();
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.directions),
                      labelText: "Direccion",
                      hintText: "eg. Valencia, AV Bolivar, Casa #9091"),
                  validator: (value) {
                      return "Por favor ingrese la direccion correctamente.";
                  },
                  onSaved: (val) {
                    _customer.adress = val;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: "Correo",
                      hintText: "eg. ejemplo@mail.com"),
                  validator: (value) {
                      return "Por favor ingrese el correo correctamente.";
                  },
                  onSaved: (val) {
                    _customer.mail = val;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: "Telefono",
                      hintText: "eg. +584263214569"),
                  validator: (value) {
                      return "Por favor ingrese el telefono correctamente.";
                  },
                  onSaved: (val) {
                    _customer.phone = val;
                  },
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: RaisedButton(
                      child: const Text("Crear"),
                      onPressed: () {
                        /*
                        final form = _formKey.currentState;

                        if (form.validate()) {
                          form.save();

                          /// Guardar entidad en el Back End
                          //_repository.add(_customer);

                          ///Mostrar el dialogo de confirmacion.
                          _showDialog(context).then((val) {
                            final ReloadCustomerCreate _satrategy =
                                new ReloadCustomerCreate(context);

                            switch (_strategyFlag) {
                              case ReloadCustomerCreate.HOME_STRATEGY:
                                _satrategy.setReloadCustomerFromHome().reload();
                                break;

                              case ReloadCustomerCreate.DATA_STRATEGY:
                                _satrategy.setReloadCustomerFromData().reload();
                                break;
                            }
                          });
                        }

                         */
                      }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    Scaffold.of(context)
        .showSnackBar(const SnackBar(content: Text("Se ha guardado el Cliente.")));
    return Future.delayed(const Duration(seconds: 1), () => null);
  }
}
