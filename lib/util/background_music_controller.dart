import 'package:get/get.dart';

class BackgroundMusicController extends GetxController{
  bool _bgSwitch = true;

  //getter -> to get the current value of _bgSwitch
  bool get bgSwitch => _bgSwitch;

  //setter -> to set new value for _bgSwitch
  void setBgSwitch(bool value){
    _bgSwitch = value;
    update();
  }
}