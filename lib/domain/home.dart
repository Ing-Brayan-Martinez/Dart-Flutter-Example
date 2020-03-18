
class Home {

  int id;
  String title;
  String subTitle;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Home();

  Home.from(this.id, this.title, this.subTitle, this.image, this.status,
      this.createdAt, this.updatedAt);

  Home.fromJson(Map<String, Object> json)
      : id = json['homeId'],
        title = json['title'],
        subTitle = json['subTitle'],
        image = json['image'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, Object> toJson() => {
    'homeId' : id,
    'title' : title,
    'subTitle' : subTitle,
    'image' : image,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };

  @override
  String toString() {
    return 'Home{homeId: $id, title: $title, subTitle: $subTitle, '
        'image: $image, status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }

}
