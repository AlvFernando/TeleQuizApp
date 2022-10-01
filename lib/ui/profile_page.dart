import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Telematers_Quiz/api/api_service.dart';
import 'package:Telematers_Quiz/widget/profile_widget.dart';
import '../model/profile.dart';
import '../util/shared_preferences_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferencesController spController = Get.find();
  late String? username;
  late Future<Profile> _futureProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = spController.username;
    _futureProfile = ApiService().profile(username!);
  }

  FutureBuilder<Profile> buildFutureBuilder(){
    return FutureBuilder<Profile>(
      future: _futureProfile,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return ProfileWidget(
              username: username!,
              firstName: snapshot.data!.firstName,
              lastName: snapshot.data!.lastName,
              description: snapshot.data!.profileDescription,
              avatarPath: snapshot.data!.avatarPath,
          );
        }else if(snapshot.hasError){
          return const ProfileWidget(
              username: "Ups, something wrong :(",
              firstName: "Ups, something wrong :(",
              lastName: "",
              description: "Ups, something wrong :(",
              avatarPath: "burung.png",
          );
        }
        return const CircularProgressIndicator();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: buildFutureBuilder(),
      ),
    );
  }
}
