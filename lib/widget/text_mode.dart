import 'package:flutter/material.dart';
import 'package:Telematers_Quiz/widget/text_mode_choice.dart';
import 'package:get/get.dart';

import '../util/quiz_controller.dart';

class TextMode extends StatelessWidget {
  final String question;
  final String options;
  final Function() onPressedPrev;
  final Function() onPressedNext;
  final String isFinish;
  final bool isPrev;
  final int questionIndex;
  final String correctAnswer;

  TextMode(
      {
        Key? key,
        required this.question,
        required this.options,
        required this.onPressedPrev,
        required this.onPressedNext,
        required this.isFinish,
        required this.isPrev,
        required this.questionIndex,
        required this.correctAnswer
      }) : super(key: key);

  final QuizController quizController = Get.find();

  void updateAnswer(String answer,int index){
    if(correctAnswer==answer){
      quizController.setUserAnswer(true, index);
    }else{
      quizController.setUserAnswer(false, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> arrOptions = options.split(',');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 108, 21, 207)
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ))),
              ),
            ),
            GetBuilder<QuizController>(
              builder:(_) => Column(
                children: [
                  TextModeChoice(
                    multipleChoice: arrOptions[0],
                    onTap: (){
                      updateAnswer(arrOptions[0],questionIndex);
                      quizController.quizUpdateState(questionIndex, 0);
                    },
                    color: (quizController.quizState[questionIndex][0])
                        ? Colors.orangeAccent
                        : const Color.fromARGB(255, 108, 21, 207),
                  ),
                  const SizedBox(height: 10),
                  TextModeChoice(
                    multipleChoice: arrOptions[1],
                    onTap: (){
                      updateAnswer(arrOptions[1],questionIndex);
                      quizController.quizUpdateState(questionIndex, 1);
                    },
                    color: (quizController.quizState[questionIndex][1])
                        ? Colors.orangeAccent
                        : const Color.fromARGB(255, 108, 21, 207),
                  ),
                  const SizedBox(height: 10),
                  TextModeChoice(
                    multipleChoice: arrOptions[2],
                    onTap: (){
                      updateAnswer(arrOptions[2],questionIndex);
                      quizController.quizUpdateState(questionIndex, 2);
                    },
                    color: (quizController.quizState[questionIndex][2])
                        ? Colors.orangeAccent
                        : const Color.fromARGB(255, 108, 21, 207),
                  ),
                  const SizedBox(height: 10),
                  TextModeChoice(
                    multipleChoice: arrOptions[3],
                    onTap: (){
                      updateAnswer(arrOptions[3],questionIndex);
                      quizController.quizUpdateState(questionIndex, 3);
                    },
                    color: (quizController.quizState[questionIndex][3])
                        ? Colors.orangeAccent
                        : const Color.fromARGB(255, 108, 21, 207),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (!isPrev) ?
                ElevatedButton(
                    onPressed: onPressedPrev,
                    child: const Text('Prev')
                ) : const SizedBox(),
                ElevatedButton(
                    onPressed: onPressedNext,
                    child: Text(isFinish)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
