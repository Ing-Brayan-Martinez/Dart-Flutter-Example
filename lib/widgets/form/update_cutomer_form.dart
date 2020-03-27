import 'package:flutter/material.dart';
import 'package:prueba_flutter/behavior/strategy/update_customer/reload_customer_update.dart';
import 'package:prueba_flutter/bloc/customer_bloc.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/shared/event/update_customer_event.dart';

class UpdateCustomerForm extends StatefulWidget {

  UpdateCustomerForm({Key key}) : super(key: key);

  @override
  UpdateCustomerFormState createState() => UpdateCustomerFormState();

}

class UpdateCustomerFormState extends State<UpdateCustomerForm> {

  GlobalKey<FormState> _formKey;
  CustomerBloc _bloc;
  Customer _oldCustomer;
  Customer _newCustomer;
  String _strategyFlag;

  @override
  void initState() {
    super.initState();
    _formKey = new GlobalKey<FormState>();
    _newCustomer = new Customer();
    _oldCustomer = new Customer();
    _bloc = new CustomerBloc();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    final UpdateCustomerEvent event =
        ModalRoute.of(context).settings.arguments;

    if (event != null) {

      /// Asignar lo que venga del evento.
      _strategyFlag = event.flag;
      //_oldCustomer = event.customer;

      /// Establecer el id de la entidad.
      //_newCustomer.setId(_oldCustomer.getId().orElse(0));

      /// Establecer el estatus de la entidad.
      if (_oldCustomer.status.isEmpty) {
        final int val = int.parse(_oldCustomer.status);
        //_newCustomer.setStatus(val);
      }

    }

    return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
              builder: (context) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: _oldCustomer.code,
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.grid_on), labelText: "Codigo", hintText: "eg. 01010102"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el codigo correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.code = val;
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.name,
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.person), labelText: "Nombre", hintText: "eg. Beco C.A"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el nombre correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.name = val.toUpperCase();
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.adress,
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.directions), labelText: "Direccion", hintText: "eg. Valencia, AV Bolivar, Casa #9091"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese la direccion correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.adress = val;
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.mail,
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.mail), labelText: "Correo", hintText: "eg. ejemplo@mail.com"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el correo correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.mail = val;
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.phone,
                        autofocus: true,
                        decoration: InputDecoration(icon: const Icon(Icons.phone), labelText: "Telefono", hintText: "eg. +584263214569"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el telefono correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.phone = val;
                        },
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: RaisedButton(
                            child: Text("Actualizar"),
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form.validate()) {

                                ///Salvar la entidad.
                                form.save();

                                ///Guardar entidad en el Back End
                                //_repository.update(_newCustomer);

                                ///Mostrar el dialogo de confirmacion.
                                 _showDialog(context).then((val) {

                                   final ReloadCustomerUpdate _satrategy =
                                      new ReloadCustomerUpdate(context);

                                   switch (_strategyFlag) {

                                     case ReloadCustomerUpdate.SEE_STRATEGY:
                                       _satrategy.setReloadCustomerFromSeeCustomer();
                                       break;

                                     case ReloadCustomerUpdate.DATA_STRATEGY:
                                       _satrategy.setReloadCustomerFromData();
                                       break;

                                   }

                                   _satrategy.reload();

                                 });
                              }
                            }
                         ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        );

  }

  Future<Null> _showDialog(BuildContext context) async {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Se ha actualizado el cliente.")));
    return Future.delayed(new Duration(seconds: 1), () => null);
  }


}
