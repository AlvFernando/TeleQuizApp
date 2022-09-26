class User {
  User({
    required this.userName,
    required this.password,
    required this.userTypeId,
  });

  String userName;
  String password;
  String userTypeId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["userName"],
    password: json["password"],
    userTypeId: json["userTypeID"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "password": password,
    "userTypeID": userTypeId,
  };
}
