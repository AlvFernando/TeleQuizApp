import 'package:flutter/material.dart';
import 'package:quiz_app1/widget/home_button.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Score Page")),
      body: Center(
          child: Column(
        children: [
          const HomeButton(),
          const Text("Your Score"),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green[100]),
            child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "100",
                  style: TextStyle(fontSize: 25),
                )),
          ),
        ],
      )),
    );
  }
}
