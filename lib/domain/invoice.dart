
import 'package:prueba_flutter/domain/customer.dart';

class Invoice {

  int id;
  String code;
  Customer customer;
  double baseAmt;
  double taxAmt;
  double taxPorcentage;
  double totalAmt;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Invoice.from(this.id, this.code, this.customer, this.baseAmt, this.taxAmt,
      this.taxPorcentage, this.totalAmt, this.status, this.createdAt,
      this.updatedAt);

  Invoice.fromJson(Map<String, Object> json)
      : id = json['invoiceId'],
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
    'invoiceId' : id,
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
    return 'Invoice{invoiceId: $id, code: $code, customer: $customer, '
        'baseAmt: $baseAmt, taxAmt: $taxAmt, taxPorcentage: $taxPorcentage, '
        'totalAmt: $totalAmt, status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }


}
