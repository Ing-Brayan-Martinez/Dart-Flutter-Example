import 'package:prueba_flutter/legacy/domain/customer.dart';

class CustomerItemEvent {

  static const String EVENT_SEE = "SEE";
  static const String EVENT_UPDATE = "UPDATE";
  static const String EVENT_DELETE = "DELETE";

  String type;
  Customer customer;

  CustomerItemEvent(this.type, this.customer);

}