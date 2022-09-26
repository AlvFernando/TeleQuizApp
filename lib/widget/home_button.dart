import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-1.0, -0.9),
      child: ElevatedButton.icon(
        onPressed: () {
          //Get.to(() => const MainPage());
          Navigator.pop(context);
        },
        icon: const Icon(Icons.home),
        label: const Text(""),
      ),
    );
  }
}
