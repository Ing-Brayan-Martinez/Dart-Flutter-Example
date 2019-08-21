
import 'package:persistence_flutter/persistence/entity/entity_context.dart';
import 'package:persistence_flutter/persistence/query/filter/filter.dart';

class QueryBuilderOrderBy<T> {

  List<Filter> _filters;
  EntityContext _context;

  QueryBuilderOrderBy(EntityContext context) {
    _context = context;
    _filters = new List();
  }
  
}