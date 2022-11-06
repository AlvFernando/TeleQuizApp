import 'package:get/get.dart';

class QuizController extends GetxController{
   List<List<bool>> _quizState = [
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
  ];

  List<bool> _userAnswer = [false,false,false,false,false];

  List<bool> get userAnswer => _userAnswer;

  void setUserAnswer(bool flag, int index) {
    _userAnswer[index] = flag;
  }

  List<List<bool>> get quizState => _quizState;

  void quizUpdateState(int question, int option) {
    for(int i=0;i<_quizState[question].length;i++){
        i==option ? _quizState[question][i]=!_quizState[question][i]
            : _quizState[question][i]=false;
        update();
    }
  }

  void reset(){
    _quizState = [
      [false,false,false,false],
      [false,false,false,false],
      [false,false,false,false],
      [false,false,false,false],
      [false,false,false,false],
    ];
    _userAnswer = [false,false,false,false,false];
  }
}