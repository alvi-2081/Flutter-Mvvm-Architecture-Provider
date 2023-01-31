class UserModel {
  int? response;
  String? message;
  bool? status;
  Data? data;

  UserModel(
      {this.response,
      this.message,
      this.status,
      this.data,
      required String token});

  UserModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    status = json['status'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? tokens;

  Data(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.tokens});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    tokens = json['tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['tokens'] = this.tokens;
    return data;
  }
}
