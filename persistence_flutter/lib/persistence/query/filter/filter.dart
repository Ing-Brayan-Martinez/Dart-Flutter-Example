import 'package:persistence_flutter/persistence/query/constants_filter.dart';

abstract class Filter {

  String compile();

  String resolver(int isMandatory) {
    final StringBuffer sql = new StringBuffer();

    if (isMandatory == FilterConst.NONE) {
        sql.write("");
        return sql.toString();
    }

    if (isMandatory == FilterConst.OR) {
      sql.write(" OR ");
      return sql.toString();
    }

    if (isMandatory == FilterConst.AND) {
      sql.write(" AND ");
      return sql.toString();
    }

  }

  String type(Object value) {
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