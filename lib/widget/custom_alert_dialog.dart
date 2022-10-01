import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  Function cancelOnTap;
  Function okOnTap;

  CustomAlertDialog({
    Key? key,
    required this.cancelOnTap,
    required this.okOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      //your code goes here
    });

    return AlertDialog(
      title: Text('Warning'),
      content: const Text('Are you sure want to go back?'),
      actions: [
        TextButton(
          onPressed: cancelOnTap(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: okOnTap(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
