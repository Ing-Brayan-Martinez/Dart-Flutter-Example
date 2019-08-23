import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:prueba_flutter/http/model/wrapper_customer_model.dart';

@GenSerializer()
class CustomerWrapperJsonSerializer extends Serializer<CustomerWrapper> {
  @override
  CustomerWrapper fromMap(Map map) {
    return new CustomerWrapper.fromMap(map['clientes'], map['type']);
  }

  @override
  Map<String, Object> toMap(CustomerWrapper model) {
    return null;
  }
}