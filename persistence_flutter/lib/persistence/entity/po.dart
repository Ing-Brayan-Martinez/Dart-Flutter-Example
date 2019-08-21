import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence/entity/entity_context.dart';
import 'package:persistence_flutter/persistence/entity/entity_manager.dart';

abstract class PO {

  Map<String, Object> _data;
  EntityContext _context;
  EntityExecute _manager;

  PO() {
    this._data = {};
    this._context = new EntityContext();
    this._manager = new EntityExecute();

    this.onHandleEntityContext(_context);
  }

  void onHandleEntityContext(EntityContext ctx);

  void loadData(covariant Map<String, Object> data) {
    _data = data;
  }

  Map<String, Object> getData() => _data;

  EntityContext get context => _context;

  void setValue(String key, Object val) {
    if (val is DateTime) {
      this._data[key] = val.toString();
    } else {
      this._data[key] = val;
    }
  }

  Object getValue(String key) {
    return this._data[key];
  }

  Optional<int> getValueAsInt(String key) {
    return Optional.ofNullable(this._data[key]);
  }

  Optional<String> getValueAsString(String key) {
    return Optional.ofNullable(this._data[key]);
  }

  Optional<double> getValueAsDouble(String key) {
    return Optional.ofNullable(this._data[key]);
  }

  Optional<num> getValueAsNum(String key) {
    return Optional.ofNullable(this._data[key]);
  }

  Optional<bool> getValueAsBool(String key) {
    return Optional.ofNullable(this._data[key]);
  }

  Optional<DateTime> getValueAsDateTime(String key) {
    return Optional.ofNullable(this._data[key]);
  }

  void save() {
    _manager.insert(_context, _data);
  }

  void update() {
    _manager.update(_context, _data);
  }

  void delete() {
    _manager.delete(_context, _data);
  }
}