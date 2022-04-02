import 'package:dart_flutter_example/domain/entity/invoice.dart';
import 'package:dart_flutter_example/repository/invoice_repository.dart';
import 'package:rxdart/rxdart.dart';

class InvoiceBloc {
  final InvoiceRepository _repository = new InvoiceMemoryRepository();
  final BehaviorSubject<List<Invoice>> _subject =
      new BehaviorSubject<List<Invoice>>();

  void getInvoices() async {
    final List<Invoice> res = await _repository.findAll();
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
