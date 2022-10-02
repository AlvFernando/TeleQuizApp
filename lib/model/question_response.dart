class QuestionResponse{
  final String status;
  final String questionMessage;
  final String optionAMessage;
  final String optionBMessage;
  final String optionCMessage;
  final String optionDMessage;

  QuestionResponse({
    required this.status,
    required this.questionMessage,
    required this.optionAMessage,
    required this.optionBMessage,
    required this.optionCMessage,
    required this.optionDMessage,
  });

  factory QuestionResponse.fromJson(Map<String,dynamic> json) => QuestionResponse(
      status: json['username'],
      questionMessage: json['questionType'],
      optionAMessage:  json['question'],
      optionBMessage: json['optionA'],
      optionCMessage: json['optionB'],
      optionDMessage: json['optionC'],
  );
}