import 'package:flutter/material.dart';

import '../model/leaderboard.dart';
import 'leaderboard_card.dart';
import 'leaderboard_top_three.dart';

class LbWidget extends StatelessWidget {
  final List<Datum> data;

  const LbWidget(
      {
        Key? key,
        required this.data
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LbTopThree(
                  avatarPath: (data.isNotEmpty) ? data[1].avatarPath
                      : 'demo_profile_picture.png',
                  point: (data.isNotEmpty)
                      ? data[1].point.toString() : '-',
                  userName: (data.isNotEmpty) ? data[1].userName : '-',
                  order: 2
              ),
              LbTopThree(
                  avatarPath: (data.isNotEmpty) ? data[0].avatarPath
                      : 'demo_profile_picture.png',
                  point: (data.isNotEmpty)
                      ? data[0].point.toString() : '-',
                  userName: (data.isNotEmpty) ? data[0].userName : '-',
                  order: 1
              ),
              LbTopThree(
                  avatarPath: (data.isNotEmpty) ? data[2].avatarPath
                      : 'demo_profile_picture.png',
                  point: (data.isNotEmpty)
                      ? data[2].point.toString() : '-',
                  userName: (data.isNotEmpty) ? data[2].userName : '-',
                  order: 2
              ),
            ],
          ),
          const SizedBox(height: 20,),
          (data.length>3) ?
            Flexible(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: data.length - 3,
                  itemBuilder: (BuildContext context, int index) {
                    return LbCard(
                      index: index + 3,
                      userName: data[index + 3].userName,
                      avatarPath: data[index + 3].avatarPath,
                      point: data[index + 3].point.toString(),
                    );
                  }
              ),
            ) :
          LbCard(
            index: 4,
            userName: '-',
            avatarPath: 'demo_profile_picture.png',
            point: '-',
          )
        ],
      ),
    );
  }
}
