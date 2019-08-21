
import 'package:persistence_flutter/persistence/entity/po.dart';
import 'package:persistence_flutter/persistence/query/query_builder.dart';
import 'package:persistence_flutter/persistence/query/query_builder_orderby.dart';

class QueryManager<T> {

  QueryManager();

  QueryBuilder createQueryBuilder(PO entity) {
    return new QueryBuilder<T>(entity.context);
  }

  QueryBuilderOrderBy createQueryBuilderOrderBy(PO entity) {
    return new QueryBuilderOrderBy<T>(entity.context);
  }
}