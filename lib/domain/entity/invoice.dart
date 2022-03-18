
import 'package:dart_flutter_example/domain/entity/customer.dart';

class Invoice {

  int? id;
  String? code;
  Customer? customer;
  double? baseAmt;
  double? taxAmt;
  double? taxPorcentage;
  double? totalAmt;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Invoice();

  Invoice.from(this.id, this.code, this.customer, this.baseAmt, this.taxAmt,
      this.taxPorcentage, this.totalAmt, this.status, this.createdAt,
      this.updatedAt);

  Invoice.fromJson(Map<String, Object> json)
      : id = json['invoiceId'] as int,
        code = json['code'] as String,
        customer = json['customer'] as Customer,
        baseAmt = json['baseAmt'] as double,
        taxAmt = json['taxAmt'] as double,
        taxPorcentage = json['taxPorcentage'] as double,
        totalAmt = json['totalAmt'] as double,
        status = json['status'] as String,
        createdAt = json['createdAt'] as DateTime,
        updatedAt = json['updatedAt'] as DateTime;

  Map<String, Object> toJson() => {
    'invoiceId' : id as int,
    'code' : code as String,
    'customer' : customer as Customer,
    'baseAmt' : baseAmt as double,
    'taxAmt' : taxAmt as double,
    'taxPorcentage' : taxPorcentage as double,
    'totalAmt' : totalAmt as double,
    'status' : status as double,
    'createdAt' : createdAt as DateTime,
    'updatedAt' : updatedAt as DateTime,
  };

  @override
  String toString() {
    return 'Invoice{invoiceId: $id, code: $code, customer: $customer, '
        'baseAmt: $baseAmt, taxAmt: $taxAmt, taxPorcentage: $taxPorcentage, '
        'totalAmt: $totalAmt, status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }


}
