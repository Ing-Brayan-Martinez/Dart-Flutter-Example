
import 'package:prueba_flutter/legacy/domain/customer.dart';

class UpdateCustomerEvent {
  Customer customer;
  String flag;

  UpdateCustomerEvent(this.customer, this.flag);

}