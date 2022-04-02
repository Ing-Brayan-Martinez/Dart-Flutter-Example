class Customer {
  int? id;
  String? code;
  String? name;
  String? adress;
  String? mail;
  String? phone;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Customer();

  Customer.min(this.id, this.name);

  Customer.from(this.id, this.code, this.name, this.adress, this.mail,
      this.phone, this.status, this.createdAt, this.updatedAt);

  Customer.fromJson(Map<String, Object> json)
      : id = json['id'] as int,
        code = json['code'] as String,
        name = json['name'] as String,
        adress = json['adress'] as String,
        mail = json['mail'] as String,
        phone = json['phone'] as String,
        status = json['status'] as String,
        createdAt = DateTime.parse(json['createdAt'] as String),
        updatedAt = DateTime.parse(json['updatedAt'] as String);

  Map<String, Object> toJson() => {
        'id': id as int,
        'code': code as String,
        'name': name as String,
        'adress': adress as String,
        'mail': mail as String,
        'phone': phone as String,
        'status': status as String,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString()
      };

  @override
  String toString() {
    return 'Customer{id: $id, code: $code, name: $name, '
        'adress: $adress, mail: $mail, phone: $phone, '
        'status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }
}
