
import 'package:get/get.dart';

class SharedPreferencesController extends GetxController{
  String? _username="";
  String? _userTypeId="";

  String? get username => _username;
  String? get userTypeId => _userTypeId;

  void setUsername(String value){
    _username = value;
    update();
  }

  void setUserTypeId(String value){
    _userTypeId = value;
    update();
  }
}