
import 'package:prueba_flutter/domain/customer.dart';

class Invoice {

  final int invoiceId;
  final String code;
  final Customer customer;
  final double baseAmt;
  final double taxAmt;
  final double taxPorcentage;
  final double totalAmt;
  final String status;
  final String createdAt;
  final String updatedAt;

  Invoice(this.invoiceId, this.code, this.customer, this.baseAmt, this.taxAmt,
      this.taxPorcentage, this.totalAmt, this.status, this.createdAt,
      this.updatedAt);

  Invoice.fromJson(Map<String, Object> json)
      : invoiceId = json['invoiceId'],
        code = json['code'],
        customer = json['customer'],
        baseAmt = json['baseAmt'],
        taxAmt = json['taxAmt'],
        taxPorcentage = json['taxPorcentage'],
        totalAmt = json['totalAmt'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, Object> toJson() => {
    'invoiceId' : invoiceId,
    'code' : code,
    'customer' : customer,
    'baseAmt' : baseAmt,
    'taxAmt' : taxAmt,
    'taxPorcentage' : taxPorcentage,
    'totalAmt' : totalAmt,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };

  @override
  String toString() {
    return 'Invoice{invoiceId: $invoiceId, code: $code, customer: $customer, '
        'baseAmt: $baseAmt, taxAmt: $taxAmt, taxPorcentage: $taxPorcentage, '
        'totalAmt: $totalAmt, status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }


}
