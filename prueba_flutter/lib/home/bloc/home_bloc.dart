import 'package:prueba_flutter/home/model/home.dart';
import 'package:prueba_flutter/home/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

  final HomeRepository _repository =  new HomeRepository();
  final BehaviorSubject<List<Home>> _subject = new BehaviorSubject<List<Home>>();

  void getHomes() async {
    final List<Home> res = await _repository.findAllList();
    _subject.sink.add(res);
  }

  void dispose() {
    _subject.close();
  }

  Stream<List<Home>> get homeStream => _subject.stream;

}