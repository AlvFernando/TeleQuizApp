import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Telematers_Quiz/util/music_player.dart';
import 'package:Telematers_Quiz/ui/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/background_music_controller.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late bool isSwitch;

  //find created controller that already defined in main.dart
  BackgroundMusicController controller = Get.find();

  //remove login shared preference data
  //login data are included
  //username, userTypeId -> API
  Future<int> removeLoginData() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('userTypeId');
    return 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      //get bgswitch value from controller
      //set isSwitch value
      isSwitch = controller.bgSwitch;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.volume_up,size: 35,),
              title: const Text('Background Music'),
              trailing: Switch(
                value: isSwitch,
                onChanged: (value){
                  (value == false) ? MusicPlayer.player.pause()
                      : MusicPlayer.player.play();
                  setState(() {
                    isSwitch = value;
                    //updating _bgswitch value in controller
                    controller.setBgSwitch(value);
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout,size: 35,),
              title: const Text('Logout'),
              onTap: (){
                removeLoginData().then((_){
                  MusicPlayer.player.stop();
                  controller.setBgSwitch(true);
                  Get.offAll(const LoginPage(isError: false,));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
