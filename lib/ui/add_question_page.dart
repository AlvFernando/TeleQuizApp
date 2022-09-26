import 'package:flutter/material.dart';
import 'package:quiz_app1/widget/home_button.dart';

class AddQuestion extends StatelessWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const HomeButton(),
                  const SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Add Your Question Here: ",
                        style: TextStyle(fontSize: 30), textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Question: "), maxLines: null,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Option 1: "), maxLines: null,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Option 2: "), maxLines: null,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Option 3: "), maxLines: null,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: "Option 4: "), maxLines: null,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //Get.to(() => MainPage());
                          },
                          child: const Text("ADD QUESTION")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
