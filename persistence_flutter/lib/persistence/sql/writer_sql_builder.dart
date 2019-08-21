
import 'package:persistence_flutter/persistence/entity/column.dart';
import 'package:persistence_flutter/persistence/entity/entity_context.dart';

class WriterSqlBuilder {

  String insert(EntityContext context, Map<String, Object> values) {
    final StringBuffer sql = new StringBuffer();
    final List<Column> columns = context.columns;
    final Column last = columns.last;

    sql.write("INSERT INTO ");
    sql.write(context.table);
    sql.write("(");

    for (Column column in columns) {
      sql.write(column.name);

      if (column != last) {
        sql.write(", ");

      } else {
        sql.write(") VALUES (");

      }
    }

    for (Column column in columns) {
      sql.write(_type(values[column.name]));

      if (column != last) {
        sql.write(", ");

      } else {
        sql.write(");");

      }
    }

    print(sql.toString());
    return sql.toString();
  }

  String updated(EntityContext context, Map<String, Object> values) {
    final StringBuffer sql = new StringBuffer();

    final List<Column> columns = context.columns;
    final Column first = columns.first;
    final Column last = columns.last;

    columns.removeWhere((cl) => cl == first);

    sql.write("UPDATE ");
    sql.write(context.table);
    sql.write(" SET ");

    for (Column column in columns) {
      sql.write(column.name);
      sql.write(" = ");
      sql.write(_type(values[column.name]));

      if (column != last) {
        sql.write(", ");

      } else {
        sql.write(" WHERE ");
        sql.write(first.name);
        sql.write(" = ");
        sql.write(_type(values[first.name]));
        sql.write(";");

      }
    }

    print(sql.toString());
    return sql.toString();
  }

  String delete(EntityContext context, Map<String, Object> values) {
    final StringBuffer sql = new StringBuffer();

    final Column first = context.columns.first;

    sql.write("DELETE FROM ");
    sql.write(context.table);

    sql.write(" WHERE ");
    sql.write(first.name);
    sql.write(" = ");
    sql.write(_type(values[first.name]));
    sql.write(";");

    print(sql.toString());
    return sql.toString();
  }

  String _type(Object value) {
    final StringBuffer sql = new StringBuffer();

    if (value is String) {
      sql.write("'");
      sql.write(value);
      sql.write("'");

    } else if (value is DateTime) {
      sql.write("'");
      sql.write(value);
      sql.write("'");

    } else {
      sql.write(value);

    }

    return sql.toString();
  }

}