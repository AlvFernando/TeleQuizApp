class AddQuestionResponse {
  AddQuestionResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory AddQuestionResponse.fromJson(Map<String, dynamic> json) => AddQuestionResponse(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.username,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctOption,
    required this.questionType,
  });

  String username;
  List<String> question;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correctOption;
  String questionType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    question: List<String>.from(json["question"].map((x) => x)),
    optionA: json["optionA"],
    optionB: json["optionB"],
    optionC: json["optionC"],
    optionD: json["optionD"],
    correctOption: json["correctOption"],
    questionType: json["questionType"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "question": List<dynamic>.from(question.map((x) => x)),
    "optionA": optionA,
    "optionB": optionB,
    "optionC": optionC,
    "optionD": optionD,
    "correctOption": correctOption,
    "questionType": questionType,
  };
}
