import 'package:dart_flutter_example/domain/entity/customer.dart';

class UpdateCustomerEvent {
  Customer customer;
  String flag;

  UpdateCustomerEvent(this.customer, this.flag);
}
