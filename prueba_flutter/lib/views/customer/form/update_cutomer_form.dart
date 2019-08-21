import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/observer/observer.dart';
import 'package:prueba_flutter/observer/observer_action.dart';
import 'package:prueba_flutter/observer/observer_event.dart';
import 'package:prueba_flutter/observer/observer_singlenton.dart';

class UpdateCustomerForm extends StatefulWidget {

  Optional<Customer> customerOpt;

  UpdateCustomerForm({Key key, this.customerOpt}) : super(key: key);

  @override
  UpdateCustomerFormState createState() => UpdateCustomerFormState();

}

class UpdateCustomerFormState extends State<UpdateCustomerForm> {

  GlobalKey<FormState> _formKey;
  Customer _oldCustomer;
  Customer _newCustomer;
  Observer _observer;

  Future<Null> _showDialog(BuildContext context) async {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("Se ha actualizado el cliente.")));
    return Future.delayed(Duration(seconds: 1), () => null);
  }

  @override
  void initState() {
    super.initState();
    _observer = SinglentonObserver.get();
    _formKey = new GlobalKey<FormState>();
    _oldCustomer = widget.customerOpt.orElseThrow(() => ArgumentError('Not customer in the form.'));
    _newCustomer = new Customer();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    _newCustomer.setId(_oldCustomer.getId().value);

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
                        initialValue: _oldCustomer.getCode().orElse(""),
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.grid_on), labelText: "Codigo", hintText: "eg. 01010102"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el codigo correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.setCode(val);
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.getName().orElse(""),
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.person), labelText: "Nombre", hintText: "eg. Beco C.A"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el nombre correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.setName(val);
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.getAdress().orElse(""),
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.directions), labelText: "Direccion", hintText: "eg. Valencia, AV Bolivar, Casa #9091"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese la direccion correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.setAdress(val);
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.getMail().orElse(""),
                        autofocus: true,
                        decoration: InputDecoration(icon: Icon(Icons.mail), labelText: "Correo", hintText: "eg. ejemplo@mail.com"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el correo correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.setMail(val);
                        },
                      ),
                      TextFormField(
                        initialValue: _oldCustomer.getPhone().orElse(""),
                        autofocus: true,
                        decoration: InputDecoration(icon: const Icon(Icons.phone), labelText: "Telefono", hintText: "eg. +584263214569"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor ingrese el telefono correctamente.";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _newCustomer.setPhone(val);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Status"),
                          Checkbox(
                            value: _oldCustomer.getStatus().isPresent
                                ? (_oldCustomer.getStatus().value == 1 ? true : false)
                                : false,
                            onChanged: (bool val) {
                              _newCustomer.setStatus(val ? 1 : 0);
                            },
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: RaisedButton(
                            child: Text("Actualizar"),
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form.validate()) {
                                 form.save();
                                 _newCustomer.update();
                                 _showDialog(context).then((val) {
                                   _observer.notify(new ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
                                   Navigator.of(context).pop();
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

}