class Quiz {
  Quiz({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
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
    required this.questionId,
    required this.questionTypeId,
    required this.question,
    required this.correctAnswer,
    required this.assetPath,
    required this.options,
  });

  String questionId;
  String questionTypeId;
  String question;
  String correctAnswer;
  dynamic assetPath;
  String options;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    questionId: json["questionID"],
    questionTypeId: json["questionTypeID"],
    question: json["question"],
    correctAnswer: json["correctAnswer"],
    assetPath: json["assetPath"],
    options: json["options"],
  );

  Map<String, dynamic> toJson() => {
    "questionID": questionId,
    "questionTypeID": questionTypeId,
    "question": question,
    "correctAnswer": correctAnswer,
    "assetPath": assetPath,
    "options": options,
  };
}
