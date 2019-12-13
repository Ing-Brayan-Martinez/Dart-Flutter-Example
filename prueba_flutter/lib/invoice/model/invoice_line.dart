
import 'package:prueba_flutter/invoice/model/invoice.dart';

class InvoiceLine {

  final int invoiceLineId;
  final Invoice invoice;
  final String description;
  final int unit;
  final double itemAmt;
  final double totalAmt;
  final String status;
  final String createdAt;
  final String updatedAt;

  InvoiceLine(this.invoiceLineId, this.invoice, this.description, this.unit,
      this.itemAmt, this.totalAmt, this.status, this.createdAt, this.updatedAt);

  InvoiceLine.fromJson(Map<String, Object> json)
      : invoiceLineId = json['invoiceLineId'],
        invoice = json['invoice'],
        description = json['description'],
        unit = json['unit'],
        itemAmt = json['itemAmt'],
        totalAmt = json['totalAmt'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, Object> toJson() => {
    'invoiceLineId' : invoiceLineId,
    'invoice' : invoice,
    'description' : description,
    'unit' : unit,
    'itemAmt' : itemAmt,
    'totalAmt' : totalAmt,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
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