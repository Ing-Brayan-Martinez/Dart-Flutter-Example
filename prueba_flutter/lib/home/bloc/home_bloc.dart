import 'package:prueba_flutter/home/model/home.dart';
import 'package:prueba_flutter/home/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

  final HomeRepository _repository =  new HomeRepository();
  final BehaviorSubject<Home> _subject = new BehaviorSubject<Home>();

  void getHomes() async {
    List<Home> res = await _repository.getHomes();
    res.forEach((co) =>  _subject.sink.add(co));
  }

  void dispose() {
    _subject.close();
  }

  Stream<Home> get homeStream => _subject.stream;

}