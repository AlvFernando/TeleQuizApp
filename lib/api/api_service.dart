import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app1/model/user.dart';

import '../model/profile.dart';

class ApiService{
  static final String? _baseUrl = dotenv.env['API_BASE_URL'];
  final String? _apiKey = dotenv.env['API_KEY'];

  //get user (login)
  Future<User>loginUser(String username,String password) async{
    User userData;
    final response = await http.post(
      Uri.parse('${_baseUrl}login'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        'key' : _apiKey!,
        'username': username,
        'password': password
      }),
    );
    if(response.statusCode == 200){
      var jsonList = jsonDecode(response.body);
      userData = User.fromJson(jsonList[0]);
      return userData;
    }else {
      throw Exception('Failed to login.');
    }
  }

  //get data (profile)
  Future <Profile>profile(String username) async{
    Profile profile;
    final response = await http.post(
      Uri.parse('${_baseUrl}profile'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        'key' : _apiKey!,
        'username': username,
      }),
    );
    if(response.statusCode == 200){
      var jsonList = jsonDecode(response.body);
      profile = Profile.fromJson(jsonList[0]);
      return profile;
    }else {
      throw Exception('Failed to get profile data.');
    }
  }
}