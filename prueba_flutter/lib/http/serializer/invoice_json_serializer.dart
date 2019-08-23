
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:prueba_flutter/http/model/wrapper_invoice_model.dart';

@GenSerializer()
class InvoiceWrapperJsonSerializer extends Serializer<InvoiceWrapper> {
  @override
  InvoiceWrapper fromMap(Map map) {
    return new InvoiceWrapper.fromMap(map['clientes'], map['type']);
  }

  @override
  Map<String, Object> toMap(InvoiceWrapper model) {
    return null;
  }
}