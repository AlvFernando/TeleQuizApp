import 'package:flutter/material.dart';
import 'package:Telematers_Quiz/widget/home_button.dart';
import 'package:get/get.dart';
import '../util/quiz_controller.dart';
import '../widget/custom_purple.dart';
import 'package:countup/countup.dart';

class ScorePage extends StatelessWidget {
  ScorePage({Key? key}) : super(key: key);

  final QuizController quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    var score = quizController.userAnswer.where(
            (element) => element==true).length /5 * 100;
    return Scaffold(
      appBar: AppBar(title: const Text("Score")),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,bottom: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Your Score is',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CircleAvatar(
                    radius: 110,
                    backgroundColor: CustomPurple.kToDark,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Countup(
                        begin: 0,
                        end: score,
                        duration: const Duration(seconds: 4),
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              HomeButton()
            ],
          ),
        ),
      ),
    );
  }
}
