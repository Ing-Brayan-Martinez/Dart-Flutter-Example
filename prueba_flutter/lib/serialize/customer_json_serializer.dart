import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:prueba_flutter/domain/customer.dart';

@GenSerializer()
class CustomerJsonSerializer extends Serializer<Customer> {

  @override
  Customer fromMap(Map map) {
    return new Customer.fromJson(map);
  }

  @override
  Map<String, Object> toMap(Customer model) {
    return model.toJson();
  }

}