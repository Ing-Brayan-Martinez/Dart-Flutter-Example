
import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

class Customer extends PO {

  static final String TABLE_NAME = "Customer";

//  static final String COLUMN_CUSTOMER_ID = "Customer_ID";
//  static final String COLUMN_CODE = "Code";
//  static final String COLUMN_NAME = "Name";
//  static final String COLUMN_ADRESS = "Adress";
//  static final String COLUMN_MAIL = "Mail";
//  static final String COLUMN_PHONE = "Phone";
//  static final String COLUMN_STATUS = "Status";

  static final String COLUMN_CUSTOMER_ID = "id";
  static final String COLUMN_CODE = "codigo";
  static final String COLUMN_NAME = "nombre";
  static final String COLUMN_ADRESS = "direccion";
  static final String COLUMN_MAIL = "correo";
  static final String COLUMN_PHONE = "telefono";
  static final String COLUMN_STATUS = "status";

  Customer() : super();

  Customer.fromJson(Map<String, Object> data) : super() {
    this.loadData(data);
  }

  Map<String, Object> toJson() => getData();

  @override
  void onHandleEntityContext(EntityContext ctx) {

    ctx.table = TABLE_NAME;

    ctx.addColumn(new Column()
      ..name = COLUMN_CUSTOMER_ID
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_CODE
      ..type = Types.VARCHAR
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_NAME
      ..type = Types.VARCHAR
      ..lenght = 100);

    ctx.addColumn(new Column()
      ..name = COLUMN_ADRESS
      ..type = Types.VARCHAR
      ..lenght = 250);

    ctx.addColumn(new Column()
      ..name = COLUMN_MAIL
      ..type = Types.VARCHAR
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_PHONE
      ..type = Types.VARCHAR
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_STATUS
      ..type = Types.INTEGER);

  }

  Optional<int> getStatus() {
    return getValueAsInt(COLUMN_STATUS);
  }

  setStatus(int val) {
    setValue(COLUMN_STATUS, val);
  }

  Optional<String> getPhone() {
    return getValueAsString(COLUMN_PHONE);
  }

  setPhone(String val) {
    setValue(COLUMN_PHONE, val);
  }

  Optional<String> getMail() {
    return getValueAsString(COLUMN_MAIL);
  }

  setMail(String val) {
    setValue(COLUMN_MAIL, val);
  }

  Optional<String> getAdress() {
    return getValueAsString(COLUMN_ADRESS);
  }

  setAdress(String val) {
    setValue(COLUMN_ADRESS, val);
  }

  Optional<String> getName() {
    return getValueAsString(COLUMN_NAME);
  }

  setName(String val) {
    setValue(COLUMN_NAME, val);
  }

  Optional<String> getCode() {
    return getValueAsString(COLUMN_CODE);
  }

  setCode(String val) {
    setValue(COLUMN_CODE, val);
  }

  Optional<int> getId() {
    return getValueAsInt(COLUMN_CUSTOMER_ID);
  }

  setId(int val) {
    setValue(COLUMN_CUSTOMER_ID, val);
  }

  @override
  String toString() {
    return 'Customer{'
        'id: ${getValue(COLUMN_CUSTOMER_ID)}, '
        'codigo: ${getValue(COLUMN_CODE)},'
        'nombre: ${getValue(COLUMN_NAME)}, '
        'direccion: ${getValue(COLUMN_ADRESS)}, '
        'correo: ${getValue(COLUMN_MAIL)}, '
        'telefono: ${getValue(COLUMN_PHONE)}, '
        'status: ${getValue(COLUMN_STATUS)}'
        '}';
  }

}
