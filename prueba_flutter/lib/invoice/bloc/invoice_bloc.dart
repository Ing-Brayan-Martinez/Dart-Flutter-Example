import 'package:prueba_flutter/invoice/model/invoice.dart';
import 'package:prueba_flutter/invoice/repository/invoice_repository.dart';
import 'package:rxdart/rxdart.dart';

class InvoiceBloc {

  final InvoiceRepository _repository =  new InvoiceRepository();
  final BehaviorSubject<Invoice> _subject = new BehaviorSubject<Invoice>();

  void getInvoices() async {
    List<Invoice> res = await _repository.findAllList();
    res.forEach((co) =>  _subject.sink.add(co));
  }

  void dispose() {
    _subject.close();
  }

  Stream<Invoice> get invoicesStream => _subject.stream;

}