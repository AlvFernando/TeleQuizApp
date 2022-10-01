import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:Telematers_Quiz/util/shared_preferences_controller.dart';

class MusicPlayer{
  static final player = AudioPlayer();
  String? _userTypeId = "";
  SharedPreferencesController controller = Get.find();

  void init() async{
    //checking userTypeId
    _userTypeId = controller.userTypeId;
    if(_userTypeId == "3"){
      await player.setUrl('${dotenv.env['API_BASE_URL']!}assets/'
          '${dotenv.env['API_KEY']!}/${dotenv.env['TRACK1']!}');
    }else{
      await player.setUrl('${dotenv.env['API_BASE_URL']!}assets/'
          '${dotenv.env['API_KEY']!}/${dotenv.env['TRACK2']!}');
    }
    player.setLoopMode(LoopMode.all);
    player.play();
  }

  void pause(){
    player.pause();
  }

  void resume(){
    player.play();
  }

  void dispose(){
    player.dispose();
  }
}