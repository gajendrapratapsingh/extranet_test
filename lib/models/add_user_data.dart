class AddUserData {
  String? status;
  AddUserResData? data;
  String? message;

  AddUserData({this.status, this.data, this.message});

  AddUserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new AddUserResData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class AddUserResData {
  String? name;
  String? salary;
  String? age;
  int? id;

  AddUserResData({this.name, this.salary, this.age, this.id});

  AddUserResData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salary = json['salary'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}