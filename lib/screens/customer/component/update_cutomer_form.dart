import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:flutter/material.dart';

class UpdateCustomerForm extends StatefulWidget {
  const UpdateCustomerForm({Key? key}) : super(key: key);

  @override
  UpdateCustomerFormState createState() => UpdateCustomerFormState();
}

class UpdateCustomerFormState extends State<UpdateCustomerForm> {
  late GlobalKey<FormState> _formKey;
  //late CustomerBloc _bloc;
  late Customer _oldCustomer;
  late Customer _newCustomer;
  //late String _strategyFlag;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _newCustomer = Customer();
    _oldCustomer = Customer();
    //_bloc = CustomerBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final UpdateCustomerEvent event =
    //    ModalRoute.of(context)?.settings.arguments as UpdateCustomerEvent;

    //_strategyFlag = event.flag;
    //_oldCustomer = event.customer;

    /// Establecer el id de la entidad.
    //_newCustomer.setId(_oldCustomer.getId().orElse(0));

    /// Establecer el estatus de la entidad.
    if (null == _oldCustomer.status) {
      //final int val = int.parse(_oldCustomer.status!);
      //_newCustomer.setStatus(val);
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
                  initialValue: _oldCustomer.code,
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.grid_on),
                      labelText: "Codigo",
                      hintText: "eg. 01010102"),
                  validator: (value) {
                    return "Por favor ingrese el codigo correctamente.";
                  },
                  onSaved: (val) {
                    _newCustomer.code = val;
                  },
                ),
                TextFormField(
                  initialValue: _oldCustomer.name,
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Nombre",
                      hintText: "eg. Beco C.A"),
                  validator: (value) {
                    return "Por favor ingrese el nombre correctamente.";
                  },
                  onSaved: (val) {
                    _newCustomer.name = val?.toUpperCase();
                  },
                ),
                TextFormField(
                  initialValue: _oldCustomer.adress,
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.directions),
                      labelText: "Direccion",
                      hintText: "eg. Valencia, AV Bolivar, Casa #9091"),
                  validator: (value) {
                    return "Por favor ingrese la direccion correctamente.";
                  },
                  onSaved: (val) {
                    _newCustomer.adress = val;
                  },
                ),
                TextFormField(
                  initialValue: _oldCustomer.mail,
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: "Correo",
                      hintText: "eg. ejemplo@mail.com"),
                  validator: (value) {
                    return "Por favor ingrese el correo correctamente.";
                  },
                  onSaved: (val) {
                    _newCustomer.mail = val;
                  },
                ),
                TextFormField(
                  initialValue: _oldCustomer.phone,
                  autofocus: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: "Telefono",
                      hintText: "eg. +584263214569"),
                  validator: (value) {
                    return "Por favor ingrese el telefono correctamente.";
                  },
                  onSaved: (val) {
                    _newCustomer.phone = val;
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: ElevatedButton(
                      child: const Text("Actualizar"),
                      onPressed: () {
                        /*final form = _formKey.currentState;
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
                        }*/
                      }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Future<void> _showDialog(BuildContext context) async {
  //   Scaffold.of(context).showSnackBar(
  //       const SnackBar(content: Text("Se ha actualizado el cliente.")));
  //   return Future.delayed(const Duration(seconds: 1), () => null);
  // }
}
