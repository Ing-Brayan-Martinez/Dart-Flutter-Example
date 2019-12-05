
import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

class Invoice extends PO {

  static final String TABLE_NAME = "Invoice";

  static final String COLUMN_INVOICE_ID = "Invoice_ID";
  static final String COLUMN_CUSTOMER_ID = "Customer_ID";
  static final String COLUMN_CREATED = "Created";
  static final String COLUMN_CODE = "Code";
  static final String COLUMN_BASE_AMT = "BaseAmt";
  static final String COLUMN_TAX_AMT = "TaxAmt";
  static final String COLUMN_TAX_PORCENTAGE = "TaxPorcentage";
  static final String COLUMN_TOTAL_AMT = "TotalAmt";

  Invoice() : super();

  Invoice.fromJson(Map<String, Object> data) : super() {
    this.loadData(data);
  }

  Map<String, Object> toJson() => getData();

  @override
  void onHandleEntityContext(EntityContext ctx) {

    ctx.table = TABLE_NAME;

    ctx.addColumn(new Column()
      ..name = COLUMN_INVOICE_ID
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_CUSTOMER_ID
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_CREATED
      ..type = Types.DATETIME);

    ctx.addColumn(new Column()
      ..name = COLUMN_CODE
      ..type = Types.VARCHAR
      ..lenght = 100);

    ctx.addColumn(new Column()
      ..name = COLUMN_BASE_AMT
      ..type = Types.NUMERIC
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_TAX_AMT
      ..type = Types.NUMERIC
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_TAX_PORCENTAGE
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_TOTAL_AMT
      ..type = Types.NUMERIC
      ..lenght = 20);

  }

  Optional<int> getId() {
    return getValueAsInt(COLUMN_INVOICE_ID);
  }

  setId(int val) {
    setValue(COLUMN_INVOICE_ID, val);
  }

  Optional<int> getCustomerId() {
    return getValueAsInt(COLUMN_CUSTOMER_ID);
  }

  setCustomerId(int val) {
    setValue(COLUMN_CUSTOMER_ID, val);
  }

  Optional<DateTime> getCreate() {
    return getValueAsDateTime(COLUMN_CREATED);
  }

  setCreate(DateTime val) {
    setValue(COLUMN_CREATED, val);
  }

  Optional<String> getCode() {
    return getValueAsString(COLUMN_CODE);
  }

  setCode(String val) {
    setValue(COLUMN_CODE, val);
  }

  Optional<num> getBaseAmt() {
    return getValueAsNum(COLUMN_BASE_AMT);
  }

  setBaseAmt(num val) {
    setValue(COLUMN_BASE_AMT, val);
  }

  Optional<num> getTaxAmt() {
    return getValueAsNum(COLUMN_TAX_AMT);
  }

  seTaxAmt(num val) {
    setValue(COLUMN_TAX_AMT, val);
  }

  Optional<int> getTaxPorcentage() {
    return getValueAsInt(COLUMN_TAX_PORCENTAGE);
  }

  setTaxPorcentage(int val) {
    setValue(COLUMN_TAX_PORCENTAGE, val);
  }

  Optional<num> getTotalAmt() {
    return getValueAsNum(COLUMN_TOTAL_AMT);
  }

  setTotalAmt(num val) {
    setValue(COLUMN_TOTAL_AMT, val);
  }

  @override
  String toString() {
    return 'Invoice{'
        'id: ${getValue(COLUMN_INVOICE_ID)}, '
        'customer_id: ${getValue(COLUMN_CUSTOMER_ID)},'
        'created: ${getValue(COLUMN_CREATED)}, '
        'code: ${getValue(COLUMN_CODE)}, '
        'baseAmt: ${getValue(COLUMN_BASE_AMT)}, '
        'taxAmt: ${getValue(COLUMN_TAX_AMT)}, '
        'taxPorcentage: ${getValue(COLUMN_TAX_PORCENTAGE)}'
        'totalAmt: ${getValue(COLUMN_TOTAL_AMT)}'
        '}';
  }

}

