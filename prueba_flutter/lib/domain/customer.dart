
class Customer {

  final int id;
  final String code;
  final String name;
  final String adress;
  final String mail;
  final String phone;
  final String status;
  final String createdAt;
  final String updatedAt;

  Customer(this.id, this.code, this.name, this.adress, this.mail, this.phone,
      this.status, this.createdAt, this.updatedAt);

  Customer.fromJson(Map<String, Object> json)
      : id = json['id'],
        code = json['code'],
        name = json['name'],
        adress = json['adress'],
        mail = json['mail'],
        phone = json['phone'],
        status = json['status'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, Object> toJson() => {
    'id' : id,
    'code' : code,
    'name' : name,
    'adress' : adress,
    'mail' : mail,
    'phone' : phone,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt
  };

  @override
  String toString() {
    return 'Customer{id: $id, code: $code, name: $name, '
        'adress: $adress, mail: $mail, phone: $phone, '
        'status: $status, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }

}
