class UserModel {
  String? userID;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? token;
  String? picture;
  UserModel({
    this.userID,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.token,
    this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['_id'],
      userName: json['username'],
      userEmail: json['email'],
      userPassword: json['password'],
      token: json['token'],
      picture: json['picture'],
    );
  }
}
