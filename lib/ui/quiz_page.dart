import 'package:Telematers_Quiz/widget/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../model/quiz.dart';
import '../util/shared_preferences_controller.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final SharedPreferencesController spController = Get.find();
  late Future<Quiz> _futureQuiz;

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
            return Text('Ups, something went wrong :(');
          }
          return const CircularProgressIndicator();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: buildFutureBuilder(),
      ),
    );
  }
}
