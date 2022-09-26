class Profile {
  Profile({
    required this.firstName,
    required this.lastName,
    required this.userTypeId,
    required this.avatarPath,
    required this.profileDescription,
  });

  String firstName;
  String lastName;
  String userTypeId;
  String avatarPath;
  String profileDescription;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    firstName: json["firstName"],
    lastName: json["lastName"] ?? "",
    userTypeId: json["userTypeID"],
    avatarPath: json["avatarPath"] ?? "",
    profileDescription: json["profileDescription"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "userTypeID": userTypeId,
    "avatarPath": avatarPath,
    "profileDescription": profileDescription,
  };
}
