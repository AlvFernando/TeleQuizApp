import 'package:Telematers_Quiz/widget/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../model/quiz.dart';
import '../util/quiz_controller.dart';
import '../util/shared_preferences_controller.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final SharedPreferencesController spController = Get.find();
  final QuizController quizController = Get.find();
  late Future<Quiz> _futureQuiz;

  Future<bool?> _dialogBuilder(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Surrender'),
          content: const Text('Are you sure want to surrender?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                quizController.reset();
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _futureQuiz = ApiService().quiz(spController.userTypeId!);
  }

  FutureBuilder<Quiz> buildFutureBuilder(){
    return FutureBuilder<Quiz>(
        future: _futureQuiz,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return QuizWidget(data: snapshot.data!.data,);
          }else if(snapshot.hasError){
            return const Text('Ups, something went wrong :(');
          }
          return const CircularProgressIndicator();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    //WillPopScope used to detect go back action by user (by button or UI)
    //before action is executed, the app will return pop up message to
    //ensure the user action
    return WillPopScope(
      onWillPop: () async{
        final shouldPop = await _dialogBuilder(context);
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Center(
          child: buildFutureBuilder(),
        ),
      ),
    );
  }
}
