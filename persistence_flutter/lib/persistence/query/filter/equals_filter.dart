
import 'package:persistence_flutter/persistence/entity/entity_context.dart';

import 'filter.dart';

class EqualsFilter extends Filter {

  EntityContext context;
  Object value;
  String column;
  int isMandatory;

  EqualsFilter(this.context, this.value, this.column, this.isMandatory);

  @override
  String compile() {
    final StringBuffer sql = new StringBuffer();
    sql.write(column);
    sql.write(" = ");
    sql.write(type(value));

    sql.write(resolver(isMandatory));

    return sql.toString();
  }




}