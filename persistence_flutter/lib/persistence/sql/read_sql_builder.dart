
import 'package:persistence_flutter/persistence/entity/entity_context.dart';
import 'package:persistence_flutter/persistence/query/filter/filter.dart';

class ReadSqlBuilder {

  List<Filter> _filters;
  EntityContext _context;

  ReadSqlBuilder(this._filters, this._context);

  String select() {
    final StringBuffer sql = new StringBuffer();
    sql.write("SELECT * FROM ");
    sql.write(_context.table);

    if (_filters.isNotEmpty) {
      sql.write(" WHERE ");
      _filters.forEach((filter) => sql.write(filter.compile()));
    }
    sql.write(";");

    print(sql.toString());
    return sql.toString();
  }

}