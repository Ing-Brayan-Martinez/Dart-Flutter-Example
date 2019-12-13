

import 'package:prueba_flutter/customer/model/customer.dart';

class UpdateCustomerEvent {
  Customer customer;
  String flag;

  UpdateCustomerEvent(this.customer, this.flag);

}