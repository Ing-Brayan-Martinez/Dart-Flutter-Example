

import 'observer.dart';

class SinglentonObserver {

  static Observer _instance;

  static Observer get() {

    if (_instance == null) {
      _instance = new Observer();
    }

    return _instance;

  }
}