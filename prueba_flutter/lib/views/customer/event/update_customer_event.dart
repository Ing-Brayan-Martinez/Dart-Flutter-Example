
import 'package:prueba_flutter/domain/customer.dart';

class UpdateCustomerEvent {
  Customer customer;
  String flag;

  UpdateCustomerEvent(this.customer, this.flag);

}