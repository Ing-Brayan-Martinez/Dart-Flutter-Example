
class FilterCustomerModel {

  String _code = '';
  String _name = '';

  FilterCustomerModel();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  @override
  String toString() {
    return 'FilterCustomerModel{'
        '_code: $_code,'
        ' _name: $_name'
        '}';
  }

}