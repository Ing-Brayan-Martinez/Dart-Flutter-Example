class Home {
  int? id;
  String? title;
  String? subTitle;
  String? image;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Home();

  Home.from(this.id, this.title, this.subTitle, this.image, this.status,
      this.createdAt, this.updatedAt);

  Home.fromJson(Map<String, Object> json)
      : id = json['homeId'] as int,
        title = json['title'] as String,
        subTitle = json['subTitle'] as String,
        image = json['image'] as String,
        status = json['status'] as String,
        createdAt = json['createdAt'] as DateTime,
        updatedAt = json['updatedAt'] as DateTime;

  Map<String, Object> toJson() => {
        'homeId': id as int,
        'title': title as String,
        'subTitle': subTitle as String,
        'image': image as String,
        'status': status as String,
        'createdAt': createdAt as DateTime,
        'updatedAt': updatedAt as DateTime,
      };

  @override
  String toString() {
    return 'Home{homeId: $id, title: $title, subTitle: $subTitle, '
        'image: $image, status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }
}
