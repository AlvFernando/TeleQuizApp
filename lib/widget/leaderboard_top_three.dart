import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'custom_purple.dart';

class LbTopThree extends StatelessWidget {
  final String avatarPath;
  final String point;
  final String userName;
  final int order;

  const LbTopThree(
      {
        Key? key,
        required this.avatarPath,
        required this.point,
        required this.userName,
        required this.order
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: (order==1) ? 60 : 40,
          backgroundColor: CustomPurple.kToDark,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: (order==1) ? 55 : 35,
            backgroundImage: NetworkImage(
                  '${dotenv.env['API_BASE_URL']!}profile_picture/'
                      '${dotenv.env['API_KEY']!}/$avatarPath'
              )
          ),
        ),
        Text(
          userName,
          style: TextStyle(
              fontSize: (order==1) ? 35 :15
          ),
        ),
        Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.hexagon,
                size: (order==1) ? 55 : 35,
                color: CustomPurple.kToDark,
              ),
              Text(
                point,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (order==1) ? 20: 10,
                    color: Colors.white
                ),
              ),
            ]
        ),
      ],
    );
  }
}
