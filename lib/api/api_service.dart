import 'dart:convert';
import 'package:Telematers_Quiz/model/add_question_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:Telematers_Quiz/model/user.dart';
import '../model/leaderboard.dart';
import '../model/profile.dart';
import '../model/quiz.dart';

class ApiService{
  static final String? _baseUrl = dotenv.env['API_BASE_URL'];
  final String? _apiKey = dotenv.env['API_KEY'];

  //get user (login)
  Future <User>loginUser(String username,String password) async{
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

  //send quiz question data
  Future <AddQuestionResponse>createQuestion(String username,String question,
      String optionA, String optionB,String optionC,String optionD,
      int correctOption, int questionType, [String? assetPath]) async{
    List<String> options = [optionA,optionB,optionC,optionD];
    final response = await http.post(
      Uri.parse('${_baseUrl}add_question'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'key' : _apiKey!,
        'username' : username,
        'question' : question,
        'options' : options,
        'correctOption' : options[correctOption],
        'questionType' : questionType,
        'assetPath' : assetPath ?? '',
      }),
    );

    if(response.statusCode == 201 ||response.statusCode == 400 ||response.statusCode == 500){
      return AddQuestionResponse.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to send quiz question data. ${response.statusCode}');
      //return AddQuestionResponse.fromJson(jsonDecode(response.body));
    }
  }

  //get data (leaderboard)
  Future<Leaderboard>leaderboard() async{
    Leaderboard leaderboard;
    final response = await http.post(
      Uri.parse('${_baseUrl}leaderboard'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        'key' : _apiKey!,
      }),
    );
    if(response.statusCode == 200){
      leaderboard = Leaderboard.fromJson(jsonDecode(response.body));
      return leaderboard;
    }else {
      throw Exception('Failed to get profile data.');
    }
  }

  //get data (quiz)
  Future<Quiz>quiz(String userTypeId) async{
    Quiz quiz;
    final response = await http.post(
      Uri.parse('${_baseUrl}quiz'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        'key' : _apiKey!,
        'userTypeId' : userTypeId
      }),
    );
    if(response.statusCode == 200){
      quiz = Quiz.fromJson(jsonDecode(response.body));
      return quiz;
    }else {
      throw Exception('Failed to get quiz data.');
    }
  }
}