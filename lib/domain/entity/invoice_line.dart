
import 'package:dart_flutter_example/domain/entity/invoice.dart';

class InvoiceLine {

  int? invoiceLineId;
  Invoice? invoice;
  String? description;
  int? unit;
  double? itemAmt;
  double? totalAmt;
  String? status;
  String? createdAt;
  String? updatedAt;

  InvoiceLine(this.invoiceLineId, this.invoice, this.description, this.unit,
      this.itemAmt, this.totalAmt, this.status, this.createdAt, this.updatedAt);

  InvoiceLine.fromJson(Map<String, Object> json)
      : invoiceLineId = json['invoiceLineId'] as int,
        invoice = json['invoice'] as Invoice,
        description = json['description'] as String,
        unit = json['unit'] as int,
        itemAmt = json['itemAmt'] as double,
        totalAmt = json['totalAmt'] as double,
        status = json['status'] as String,
        createdAt = json['createdAt'] as String,
        updatedAt = json['updatedAt'] as String;

  Map<String, Object> toJson() => {
    'invoiceLineId' : invoiceLineId as int,
    'invoice' : invoice as Invoice,
    'description' : description as String,
    'unit' : unit as int,
    'itemAmt' : itemAmt as double,
    'totalAmt' : totalAmt as double,
    'status' : status as String,
    'createdAt' : createdAt as String,
    'updatedAt' : updatedAt as String,
  };

  @override
  String toString() {
    return 'InvoiceLine{invoiceLineId: $invoiceLineId, '
        'invoice: $invoice, description: $description, '
        'unit: $unit, itemAmt: $itemAmt, totalAmt: $totalAmt, '
        'status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }


}
