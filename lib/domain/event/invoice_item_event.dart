

import 'package:dart_flutter_example/domain/entity/invoice.dart';

class InvoiceItemEvent {

  static const String EVENT_SEE = "SEE";
  static const String EVENT_UPDATE = "UPDATE";
  static const String EVENT_DELETE = "DELETE";

  String type;
  Invoice invoice;

  InvoiceItemEvent(this.type, this.invoice);

}
