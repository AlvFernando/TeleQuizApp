import 'package:flutter/material.dart';

class TextModeChoice extends StatelessWidget {
  final String multipleChoice;
  final Function() onTap;
  final Color color;

  const TextModeChoice(
      {
        Key? key,
        required this.multipleChoice,
        required this.onTap,
        required this.color,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 70,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50)),
          child: Align(
              alignment: Alignment.center,
              child: Text(multipleChoice,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  )
              )
          )
      ),
    );
  }
}
