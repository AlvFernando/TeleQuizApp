import 'package:flutter/material.dart';
import 'package:quiz_app1/widget/home_button.dart';
import 'package:quiz_app1/widget/text_mode_choice.dart';

class TextMode extends StatelessWidget {
  const TextMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HomeButton(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                decoration: const BoxDecoration(color: Color.fromARGB(255, 108, 21, 207)),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text("SOAL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ))),
              ),
            ),
            Column(
              children: const [
                TextModeChoice(multipleChoice: 'A'),
                SizedBox(height: 10),
                TextModeChoice(multipleChoice: 'B'),
                SizedBox(height: 10),
                TextModeChoice(multipleChoice: 'C'),
                SizedBox(height: 10),
                TextModeChoice(multipleChoice: 'D'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
