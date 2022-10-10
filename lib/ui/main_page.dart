import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Telematers_Quiz/util/music_player.dart';
import 'package:Telematers_Quiz/ui/add_question_page.dart';
import 'package:Telematers_Quiz/ui/profile_page.dart';
import 'package:Telematers_Quiz/ui/quiz_page.dart';
import 'package:Telematers_Quiz/ui/setting_page.dart';
import 'package:Telematers_Quiz/widget/app_button.dart';
import 'package:Telematers_Quiz/widget/pic_mode.dart';
import '../util/add_quiz_validation_controller.dart';
import '../util/background_music_controller.dart';
import '../util/shared_preferences_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  final musicPlayer = MusicPlayer();
  SharedPreferencesController spController = Get.find();
  BackgroundMusicController bmController = Get.find();
  AddQuizValidationController validationController = Get.find();
  late final String username;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    (bmController.bgSwitch==true) ? musicPlayer.init() : null;
    setState(() {
      username = spController.username!;
    });

    //toast message will show if user succeed add the question
    if(validationController.isSucceed){
      Fluttertoast.showToast(
          msg: "Success Add Question",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      validationController.isSucceed = false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused) {
        musicPlayer.pause();
      } else {
        if(bmController.bgSwitch == true){
          musicPlayer.resume();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tele Quiz App",style: TextStyle(fontSize: 20),),
            const SizedBox(width: 20),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(const SettingPage());
                    },
                    icon: const Icon(Icons.settings)),
                const SizedBox(width: 20),
                IconButton(
                    onPressed: () {
                      //go to profile page
                      Get.to(const ProfilePage());
                    },
                    icon: const Icon(Icons.person)
                )
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  //height: 100,
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      username,
                      style: const TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    )),
              ),
              Column(
                children: [
                  AppButton(
                    inputText: "Play",
                    inputNavigation: () {
                      Get.to(() => const QuizPage());
                    },
                    inputColor: const Color.fromARGB(255, 108, 21, 207),
                  ),
                  AppButton(
                    inputText: "LeaderBoard",
                    inputNavigation: () {
                      Get.to(() => const PictureMode());
                    },
                    inputColor: const Color.fromARGB(255, 108, 21, 207),
                  ),
                  AppButton(
                    inputText: "Add Question",
                    inputNavigation: () {
                      Get.to(() => const AddQuestion());
                    },
                    inputColor: const Color.fromARGB(255, 108, 21, 207),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
