
import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

class InvoiceItem extends PO {

  static final String TABLE_NAME = "InvoiceItem";

  static final String COLUMN_INVOICE_ITEM_ID = "InvoiceLine_ID";
  static final String COLUMN_INVOICE_ID = "Invoice_ID";
  static final String COLUMN_DESCRIPTION = "Description";
  static final String COLUMN_UNIT = "Unit";
  static final String COLUMN_ITEM_AMT = "ItemAmt";
  static final String COLUMN_TOTAL_AMT = "TotalAmt";

  InvoiceItem() : super();

  InvoiceItem.fromJson(Map<String, Object> data) : super() {
    loadData(data);
  }

  Map<String, Object> toJson() => getData();

  @override
  void onHandleEntityContext(EntityContext ctx) {

    ctx.table = TABLE_NAME;

    ctx.addColumn(new Column()
      ..name = COLUMN_INVOICE_ITEM_ID
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_INVOICE_ID
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_DESCRIPTION
      ..type = Types.DATETIME);

    ctx.addColumn(new Column()
      ..name = COLUMN_UNIT
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_ITEM_AMT
      ..type = Types.NUMERIC
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_TOTAL_AMT
      ..type = Types.NUMERIC
      ..lenght = 20);

  }

  Optional<int> getId() {
    return getValueAsInt(COLUMN_INVOICE_ITEM_ID);
  }

  setId(int val) {
    setValue(COLUMN_INVOICE_ITEM_ID, val);
  }

  Optional<int> getInvoiceId() {
    return getValueAsInt(COLUMN_INVOICE_ID);
  }

  setInvoiceId(int val) {
    setValue(COLUMN_INVOICE_ID, val);
  }

  Optional<String> getDescription() {
    return getValueAsString(COLUMN_DESCRIPTION);
  }

  setDescription(String val) {
    setValue(COLUMN_DESCRIPTION, val);
  }

  Optional<int> getUnit() {
    return getValueAsInt(COLUMN_UNIT);
  }

  setUnit(int val) {
    setValue(COLUMN_UNIT, val);
  }

  Optional<num> getItemAmt() {
    return getValueAsNum(COLUMN_ITEM_AMT);
  }

  seItemAmt(num val) {
    setValue(COLUMN_ITEM_AMT, val);
  }

  Optional<num> getTotalAmt() {
    return getValueAsNum(COLUMN_TOTAL_AMT);
  }

  setTotalAmt(num val) {
    setValue(COLUMN_TOTAL_AMT, val);
  }

  @override
  String toString() {
    return 'InvoiceLine{'
        'id: ${getValue(COLUMN_INVOICE_ITEM_ID)}, '
        'invoice_id: ${getValue(COLUMN_INVOICE_ID)},'
        'description: ${getValue(COLUMN_DESCRIPTION)}, '
        'unit: ${getValue(COLUMN_UNIT)}, '
        'itemAmt: ${getValue(COLUMN_ITEM_AMT)}, '
        'totalAmt: ${getValue(COLUMN_TOTAL_AMT)}'
        '}';
  }

}