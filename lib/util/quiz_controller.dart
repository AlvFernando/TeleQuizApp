import 'package:get/get.dart';

class QuizController extends GetxController{
  List<List<bool>> _quizState = [
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
    [false,false,false,false],
  ];

  List<List<bool>> get quizState => _quizState;

  void quizUpdateState(int question, int option) {
    for(int i=0;i<_quizState[question].length;i++){
        i==option ? _quizState[question][i]=!_quizState[question][i]
            : _quizState[question][i]=false;
        update();
    }
  }
}