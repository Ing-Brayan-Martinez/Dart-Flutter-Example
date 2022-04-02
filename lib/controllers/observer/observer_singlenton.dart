import 'observer.dart';

class SinglentonObserver {
  static Observer? _instance;

  static Observer? get() {
    _instance ??= Observer();

    return _instance;
  }
}
