
class Column {

  String _name = "";
  String _type = "";
  int _lenght = 0;
  bool _notNull = true;
  String _defaultVal = "";

  Column();

  String get defaultVal => _defaultVal;

  set defaultVal(String value) {
    _defaultVal = value;
  }

  bool get notNull => _notNull;

  set notNull(bool value) {
    _notNull = value;
  }

  int get lenght => _lenght;

  set lenght(int value) {
    _lenght = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

}


