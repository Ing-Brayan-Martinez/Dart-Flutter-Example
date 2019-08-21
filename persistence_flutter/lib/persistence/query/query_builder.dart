
import 'package:persistence_flutter/persistence/query/filter/equals_filter.dart';
import 'package:persistence_flutter/persistence/query/filter/filter.dart';
import 'package:persistence_flutter/persistence/query/filter/like_filter.dart';
import 'package:persistence_flutter/persistence/query/query_execute.dart';
import 'package:persistence_flutter/persistence/entity/entity_context.dart';

class QueryBuilder<T> {

  List<Filter> _filters;
  EntityContext _context;

  QueryBuilder(EntityContext context) {
    _context = context;
    _filters = new List();
  }

  QueryBuilder addEqualsFilter(Object value, String column, int isMandatory) {
    _filters.add(new EqualsFilter(_context, value, column, isMandatory));
    return this;
  }

  QueryBuilder addLikeFilter(Object value, String column, int isMandatory) {
    _filters.add(new LikeFilter(_context, value, column, isMandatory));
    return this;
  }

  QueryExecute create() {
    return new QueryExecute<T>(_filters, _context);
  }
}