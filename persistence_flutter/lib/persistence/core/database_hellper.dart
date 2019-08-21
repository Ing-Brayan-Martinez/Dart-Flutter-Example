import 'package:path/path.dart';
import 'package:persistence_flutter/persistence/core/database-config.dart';
import 'package:persistence_flutter/persistence/entity/entity_context.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static DatabaseHelper _instance;

  final DataBaseConfig _databaseConfig;


  ///Para implementar el patron singlenton usando la
  ///palabra reservada factory
  ///
  factory DatabaseHelper(DataBaseConfig databaseConfig) {
    if (_instance == null) {
      _instance = new DatabaseHelper._internal(databaseConfig);
    }
    return _instance;
  }

  ///Constructor real
  ///
  DatabaseHelper._internal(this._databaseConfig);

  ///open database
  ///
  void open() async {
    await _createDataBase();
  }

  ///create or update database
  ///
  Future<Database> _createDataBase() async {
    return await openDatabase(
        join(await getDatabasesPath(), _databaseConfig.databaseName),
        version: _databaseConfig.databaseVersion,
        singleInstance: true,

        ///Para crear todas las tablas de la base de datos
        ///
        onCreate: (Database db, int version) async {

          for (var entity in _databaseConfig.databaseTables) {

            final EntityContext context = entity.context;
            final StringBuffer sql = new StringBuffer();

            sql.write("CREATE TABLE IF NOT EXISTS ${context.table} ( \n");

            final columns = context.columns;
            final last = columns.last;
            final first = columns.first;

            context.columns.forEach((column) {

              if (column.name.isNotEmpty) {
                sql.write("\t${column.name} ");
              }

              if (column.type.isNotEmpty) {
                sql.write("${column.type}");
              }

              if (column.lenght != 0) {
                sql.write("(${column.lenght})");
              }

              if (column == first ) {
                sql.write(" PRIMARY KEY AUTOINCREMENT");
              }
              
              if (column != last) {
                sql.write(", \n");

              } else {
                sql.write("\n");
              }

            });

            sql.write("); \n");

            print(sql.toString());

            try {
              await db.transaction((txn) async {
                var batch = txn.batch();
                batch.execute(sql.toString());
                await batch.commit();
              });

            } catch (e) {

            }
          }

        }
      );
  }

  ///Esto se usa para entrar en la
  ///base de datos y hacer operaciones.
  ///
  Future<Database> _reOpenDataBase() async {
    return await openDatabase(
        join(await getDatabasesPath(), _databaseConfig.databaseName),
        version: _databaseConfig.databaseVersion,
        singleInstance: true,

        ///Para crear todas las tablas de la base de datos
        ///
        onCreate: (Database db, int version) async {

        }
    );
  }

  /// Insertar un registro
  ///
  void insert(String sql) async {
    _reOpenDataBase().then((db) => db.rawInsert(sql));
  }

  /// Actualizar un registro
  ///
  void update(String sql) async {
    _reOpenDataBase().then((db) => db.rawUpdate(sql));
  }

  /// Eliminar un registro
  ///
  void delete(String sql) async {
    _reOpenDataBase().then((db) => db.rawDelete(sql) );
  }

  /// Consultar con y sin filtros
  ///
  Future<List<Map<String, Object>>> find(String sql) async {
    final Database db = await _reOpenDataBase();
    return db.rawQuery(sql);
  }

}