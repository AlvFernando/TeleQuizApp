import 'package:Telematers_Quiz/util/add_quiz_validation_controller.dart';
import 'package:Telematers_Quiz/util/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Telematers_Quiz/ui/login_page.dart';
import 'package:Telematers_Quiz/ui/main_page.dart';
import 'package:Telematers_Quiz/util/music_player.dart';
import 'package:Telematers_Quiz/util/shared_preferences_controller.dart';
import 'package:Telematers_Quiz/widget/custom_purple.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util/background_music_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  //initiate controller to save value
  //*
  //isSwitch
  //username
  //userTypeId
  //*
  Get.put(BackgroundMusicController());
  Get.put(SharedPreferencesController());
  Get.put(AddQuizValidationController());
  Get.put(QuizController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? username = "";

  SharedPreferencesController controller = Get.find();

  //load shared preferences data if exist
  void _loadLoginData() async{
    final prefs = await SharedPreferences.getInstance();
    controller.setUsername(prefs.getString('username')!);
    controller.setUserTypeId(prefs.getString('userTypeId')!);
    setState(() {
      username = controller.username;
    });
  }
  //

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLoginData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //*
    //why dispose music player in main.dart?
    //to maintain the player if the user doing change account.
    //player will be disposed when the application closed
    //*
    MusicPlayer.player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Get.put(BackgroundMusicController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: CustomPurple.kToDark,
          fontFamily: 'FrostbiteBossFight'
      ),
      //check if there is data, go to main page, else go to login page
      home: (username!.isEmpty) ? const LoginPage(isError: false,) :
        const MainPage(),
    );
  }
}

