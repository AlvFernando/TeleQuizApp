class Question{
  final String username;
  final String questionType;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final int correctOption;

  Question({
    required this.username,
    required this.questionType,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctOption
  });

  factory Question.fromJson(Map<String,dynamic> json) => Question(
    username: json['username'],
    questionType: json['questionType'],
    question:  json['question'],
    optionA: json['optionA'],
    optionB: json['optionB'],
    optionC: json['optionC'],
    optionD: json['optionD'],
    correctOption: json['correctOption']
  );
}