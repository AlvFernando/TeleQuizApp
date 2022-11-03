class Leaderboard {
  Leaderboard({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.avatarPath,
    required this.userName,
    required this.point,
  });

  String avatarPath;
  String userName;
  int point;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    avatarPath: json["avatarPath"],
    userName: json["userName"],
    point: json["point"],
  );

  Map<String, dynamic> toJson() => {
    "avatarPath": avatarPath,
    "userName": userName,
    "point": point,
  };
}
