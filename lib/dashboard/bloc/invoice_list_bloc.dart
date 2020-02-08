import 'package:prueba_flutter/invoice/model/invoice.dart';
import 'package:prueba_flutter/invoice/repository/invoice_repository.dart';
import 'package:rxdart/rxdart.dart';

class InvoiceListBloc {

  final InvoiceRepository _repository =  new InvoiceRepository();
  final BehaviorSubject<List<Invoice>> _subject = new BehaviorSubject<List<Invoice>>();

  void getInvoices() async {
    final List<Invoice> res = await _repository.findAllList();
    _subject.sink.add(res);
  }

  void getInvoicesByCode(String code) async {
    final List<Invoice> res = await _repository.findByCode(code);
    _subject.sink.add(res);
  }

  void getInvoicesByCustomerName(String name) async {
    final List<Invoice> res = await _repository.findByCustomerName(name);
    _subject.sink.add(res);
  }

  void getInvoicesByCustomerCode(String code) async {
    final List<Invoice> res = await _repository.findByCustomerCode(code);
    _subject.sink.add(res);
  }

//  void getInvoicesByFilter(FilterInvoice filter) async {
//    final List<Invoice> res = await _repository.findByFilter(filter);
//    _subject.sink.add(res);
//  }

  void dispose() {
    _subject.close();
  }

  Stream<List<Invoice>> get invoicesStream => _subject.stream;

}