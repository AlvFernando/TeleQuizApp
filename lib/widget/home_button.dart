import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/main_page.dart';
import '../util/quiz_controller.dart';

class HomeButton extends StatelessWidget {
  HomeButton({Key? key}) : super(key: key);
  final QuizController quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        quizController.reset();
        Get.offAll(() => const MainPage());
      },
      icon: const Icon(Icons.home),
      label: const Text("Main Menu"),
    );
  }
}
