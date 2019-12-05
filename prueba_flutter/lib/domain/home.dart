
class Home {

  final int homeId;
  final String title;
  final String subTitle;
  final String image;
  final String status;
  final String createdAt;
  final String updatedAt;

  Home(this.homeId, this.title, this.subTitle, this.image, this.status,
      this.createdAt, this.updatedAt);

  Home.fromJson(Map<String, Object> json)
      : homeId = json['homeId'],
        title = json['title'],
        subTitle = json['subTitle'],
        image = json['image'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, Object> toJson() => {
    'homeId' : homeId,
    'title' : title,
    'subTitle' : subTitle,
    'image' : image,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };

  @override
  String toString() {
    return 'Home{homeId: $homeId, title: $title, subTitle: $subTitle, '
        'image: $image, status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }

}