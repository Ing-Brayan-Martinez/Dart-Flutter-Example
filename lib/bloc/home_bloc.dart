import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:dart_flutter_example/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final HomeRepository _repository = new HomeMemoryRepository();
  final BehaviorSubject<List<Home>> _subject =
      new BehaviorSubject<List<Home>>();

  void getHomes() async {
    final List<Home> res = await _repository.findAll();
    _subject.sink.add(res);
  }

  void dispose() {
    _subject.close();
  }

  Stream<List<Home>> get homeStream => _subject.stream;
}
