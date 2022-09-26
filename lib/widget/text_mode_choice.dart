import 'package:flutter/material.dart';

class TextModeChoice extends StatelessWidget {
  final String multipleChoice;

  const TextModeChoice({Key? key, required this.multipleChoice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 108, 21, 207),
            borderRadius: BorderRadius.circular(50)),
        child: Align(
            alignment: Alignment.center,
            child: Text(multipleChoice,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ))));
  }
}
