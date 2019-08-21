import 'package:persistence_flutter/persistence/core/database-config.dart';
import 'package:persistence_flutter/persistence/core/database_hellper.dart';

class DatabaseManager {


  Future<bool> init(Function result) {

    final DataBaseConfig config = new DataBaseConfig();
    result(config);

    final DatabaseHelper helper = new DatabaseHelper(config);
    helper.open();

    return Future.value(true);

  }

}