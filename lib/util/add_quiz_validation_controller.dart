import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//this controller store the value of validation message
//and flag for user is succeed or not adding the question
//*
//this class will return message as String (translate from
//array to a single string)
//*
class AddQuizValidationController extends GetxController{
  List<String> _question=[];
  List<String> _optionA=[];
  List<String> _optionB=[];
  List<String> _optionC=[];
  List<String> _optionD=[];
  bool _isSucceed = false;

  List<String> get question => _question;
  List<String> get optionA => _optionA;
  List<String> get optionB => _optionB;
  List<String> get optionC => _optionC;
  List<String> get optionD => _optionD;
  bool get isSucceed => _isSucceed;

  set isSucceed(bool value) {
    _isSucceed = value;
    update();
  }
  set question(List<String> value) {
    _question = value;
    update();
  }
  set optionA(List<String> value) {
    _optionA = value;
    update();
  }
  set optionB(List<String> value) {
    _optionB = value;
    update();
  }
  set optionC(List<String> value) {
    _optionC = value;
    update();
  }
  set optionD(List<String> value) {
    _optionD = value;
    update();
  }

  //getter to return string message instead of array
  String get stringQuestion => (_question.isNotEmpty) ? _question.reduce(
          (value, element) => '$value, $element') : '';
  String get stringOptionA => (_optionA.isNotEmpty) ? _optionA.reduce(
          (value, element) => '$value, $element') : '';
  String get stringOptionB => (_optionB.isNotEmpty) ? _optionB.reduce(
          (value, element) => '$value, $element') : '';
  String get stringOptionC => (_optionC.isNotEmpty) ? _optionC.reduce(
          (value, element) => '$value, $element') : '';
  String get stringOptionD => (_optionD.isNotEmpty) ? _optionD.reduce(
          (value, element) => '$value, $element') : '';

  //function to reset the validation data
  void clearValidation(){
    _question = [];
    _optionA = [];
    _optionB = [];
    _optionC = [];
    _optionD = [];
  }
}