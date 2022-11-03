import 'package:Telematers_Quiz/api/api_service.dart';
import 'package:Telematers_Quiz/model/leaderboard.dart';
import 'package:flutter/material.dart';

import '../widget/leaderboard_widget.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  late Future<Leaderboard> _futureLeaderboard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureLeaderboard = ApiService().leaderboard();
  }

  FutureBuilder<Leaderboard> buildFutureBuilder(){
    return FutureBuilder<Leaderboard>(
        future: _futureLeaderboard,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return LbWidget(data: snapshot.data!.data,);
          }else if(snapshot.hasError){
            return Text('Ups, something went wrong :(');
          }
          return const CircularProgressIndicator();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: Center(
          child: buildFutureBuilder()
      ),
    );
  }
}
