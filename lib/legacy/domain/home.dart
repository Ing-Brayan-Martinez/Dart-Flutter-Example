
import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

class Home extends PO {

  static final String TABLE_NAME = "Home";

  static final String COLUMN_HOME_ID = "Home_ID";
  static final String COLUMN_TITLE = "Title";
  static final String COLUMN_SUBTITLE = "SubTitle";
  static final String COLUMN_IMAGE = "Image";

  Home() : super();

  Home.fromJson(Map<String, Object> data) : super() {
    this.loadData(data);
  }

  Map<String, Object> toJson() => getData();

  @override
  void onHandleEntityContext(EntityContext ctx) {

    ctx.table = TABLE_NAME;

    ctx.addColumn(new Column()
      ..name = COLUMN_HOME_ID
      ..type = Types.INTEGER);

    ctx.addColumn(new Column()
      ..name = COLUMN_TITLE
      ..type = Types.VARCHAR
      ..lenght = 20);

    ctx.addColumn(new Column()
      ..name = COLUMN_SUBTITLE
      ..type = Types.VARCHAR
      ..lenght = 100);

    ctx.addColumn(new Column()
      ..name = COLUMN_IMAGE
      ..type = Types.VARCHAR
      ..lenght = 250);
    
  }

  setId(int val) {
    setValue(COLUMN_HOME_ID, val);
  }

  Optional<int> getId() {
    return getValueAsInt(COLUMN_HOME_ID);
  }

  setTitle(String val) {
    setValue(COLUMN_TITLE, val);
  }

  Optional<String> getTitle() {
    return getValueAsString(COLUMN_TITLE);
  }

  setSubTitle(String val) {
    setValue(COLUMN_SUBTITLE, val);
  }

  Optional<String> getSubTitle() {
    return getValueAsString(COLUMN_SUBTITLE);
  }

  setImage(String val) {
    setValue(COLUMN_IMAGE, val);
  }

  Optional<String> getImage() {
    return getValueAsString(COLUMN_IMAGE);
  }

  @override
  String toString() {
    return 'Home{'
        ' id: ${getValue(COLUMN_HOME_ID)}, '
        ' title: ${getValue(COLUMN_TITLE)}, '
        ' subTitle: ${getValue(COLUMN_SUBTITLE)},'
        ' image: ${getValue(COLUMN_IMAGE)}'
        '}';
  }


}