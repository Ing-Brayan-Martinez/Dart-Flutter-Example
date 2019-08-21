
import 'package:persistence_flutter/persistence/entity/entity_context.dart';

import 'filter.dart';

class LikeFilter extends Filter {

  EntityContext context;
  Object value;
  String column;
  int isMandatory;

  LikeFilter(this.context, this.value, this.column, this.isMandatory);

  @override
  String compile() {
    final StringBuffer sql = new StringBuffer();
    sql.write(column);
    sql.write(" LIKE ");
    sql.write(type("%${value}%"));

    sql.write(resolver(isMandatory));

    return sql.toString();
  }


}