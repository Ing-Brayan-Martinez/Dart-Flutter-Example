

import 'package:prueba_flutter/domain/entity/customer.dart';

class UpdateCustomerEvent {
  Customer customer;
  String flag;

  UpdateCustomerEvent(this.customer, this.flag);

}
