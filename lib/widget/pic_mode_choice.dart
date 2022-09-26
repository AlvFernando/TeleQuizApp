import 'package:flutter/material.dart';

class PictureModeChoice extends StatelessWidget {
  final String inputText;
  const PictureModeChoice({Key? key, required this.inputText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        width: 150,
        height: 90,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 108, 21, 207),
            borderRadius: BorderRadius.circular(50)),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              inputText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}