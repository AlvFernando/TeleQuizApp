import 'package:flutter/material.dart';
import 'package:Telematers_Quiz/widget/home_button.dart';
import 'package:Telematers_Quiz/widget/pic_mode_choice.dart';

class PictureMode extends StatelessWidget {
  const PictureMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButton(),
            Container(
              margin: const EdgeInsets.all(10),
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(color: Colors.lightGreen),
                child: Column(
                  children: const [
                    Expanded(
                      child: SizedBox(
                        width: 300,
                        height: 250,
                        child: Image(image: AssetImage("assets/burung.png")),
                      ),
                    ),
                    Align(
                        alignment: Alignment(0.0, 1.0),
                        child: Text("SOAL GAMBAR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20))),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    PictureModeChoice(inputText: "A"),
                    PictureModeChoice(inputText: "B"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    PictureModeChoice(inputText: "C"),
                    PictureModeChoice(inputText: "D"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
