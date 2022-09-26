import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppButton extends StatelessWidget {
  final String inputText;
  final Function() inputNavigation;
  final Color inputColor;

  const AppButton(
      {Key? key,
        required this.inputText,
        required this.inputNavigation,
        required this.inputColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
      Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
        decoration: BoxDecoration(
          color: inputColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: inputNavigation,
          child: Align(
              alignment: const Alignment(-0.80, 0.0),
              child: Text(
                inputText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              )),
        ),
      ),
      Positioned(
        right: 5,
        top: -30,
        child: SizedBox(
          width: 150,
          height: 150,
          child:
          Image.network(
              '${dotenv.env['API_BASE_URL']!}assets/${dotenv.env['API_KEY']!}/'
                  '${dotenv.env['IMAGE1']!}'
          ),
        ),
      )
    ]);
  }
}
