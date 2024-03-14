class Data {
  int? userId;
  String? userName;
  String? userEmail;
  int? userPhone;
  int? userVerymycode;
  int? userImprove;
  String? userCreate;
  String? password;

  Data(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userVerymycode,
      this.userImprove,
      this.userCreate,
      this.password});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userVerymycode = json['user_verymycode'];
    userImprove = json['user_improve'];
    userCreate = json['user_create'];
    password = json['password'];
  }
}
