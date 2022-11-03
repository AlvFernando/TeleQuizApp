import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'custom_purple.dart';

class LbCard extends StatelessWidget {
  final int index;
  final String userName;
  final String avatarPath;
  final String point;

  const LbCard(
      {
        Key? key,
        required this.index,
        required this.userName,
        required this.avatarPath,
        required this.point,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                SizedBox(width: 15,child: Text('${index+1}')),
                const SizedBox(width: 10,),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: CustomPurple.kToDark,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: NetworkImage(
                        '${dotenv.env['API_BASE_URL']!}profile_picture/'
                            '${dotenv.env['API_KEY']!}/$avatarPath'
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Text(userName),
              ],
            ),
          ),
          Text(point)
        ],
      ),
    );
  }
}
