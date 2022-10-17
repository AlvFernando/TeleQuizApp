import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppButton extends StatelessWidget {
  final String inputText;
  final Function() onTap;
  final String inputImage;
  final double right;
  final double top;

  const AppButton({
    Key? key,
    required this.inputText,
    required this.onTap,
    required this.inputImage,
    required this.right,
    required this.top
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 105,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 108, 21, 207),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                          inputText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: right,
            top: top,
            child: SizedBox(
              width: 110,
              height: 110,
              child: Image.network(
                  '${dotenv.env['API_BASE_URL']!}assets/${dotenv.env['API_KEY']!}/'
                      '${dotenv.env[inputImage]!}'
              ),
            ),
          )
        ],
      ),
    );
  }
}
