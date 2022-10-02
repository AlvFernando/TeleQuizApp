import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Telematers_Quiz/api/api_service.dart';
import '../model/user.dart';
import '../util/shared_preferences_controller.dart';
import '../widget/custom_purple.dart';
import 'main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  //flag for error message
  //false -> no error
  //true -> error when login failed
  final bool isError;
  const LoginPage({Key? key, required this.isError}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  Future<User>? _futureUser;

  SharedPreferencesController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  //called when _futureUser filled with value
  FutureBuilder<User> buildFutureBuilder(){
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context,snapshot){
        if(snapshot.hasData){
          //saving value to shared preference controller
          controller.setUsername(snapshot.data!.userName);
          controller.setUserTypeId(snapshot.data!.userTypeId);
          //saving login data with shared preferences
          saveLoginData(snapshot.data!.userName,
              snapshot.data!.userTypeId).then((_){
            //go to main page
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.off(() => const MainPage());
            });
            //
          });
          //
        }else if(snapshot.hasError){
          //error when login, so return to login page with error message
          return const LoginPage(isError: true,);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  //function for save login data
  //login data are included
  //username, userTypeId -> API
  //*
  //why password not saved as well? because the scope of this application
  //is small and username in this application is already unique
  //*
  Future<int> saveLoginData(String userName, String userTypeId) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username',userName);
    await prefs.setString('userTypeId',userTypeId);
    return 0;
  }

  Center buildLoginFrom(){
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            //this container is for error message
            //if is error == true then show the box
            //else set the height to 0 & content to null
            //*
            //the code is not optimal yet, feel free to optimize the code
            //*
            SizedBox(
              height: (widget.isError==true) ? 45.0 : 0,
              child: (widget.isError==true) ?
                Container(
                  decoration: BoxDecoration(
                      color: CustomPurple.kToDark.withOpacity(0.8),
                      borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                  child: const Center(
                    child: Text("Invalid Login Data Goblok !",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,),
                  )) : null,
            ),
            TextField(
              controller: _usernameController,
              style: const TextStyle(fontFamily: 'roboto'),
              decoration: const InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: "Username"
              ),
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              style: const TextStyle(fontFamily: 'roboto'),
              decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: "Password"),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    //type casting to prevent error
                    _futureUser = ApiService().loginUser(
                        _usernameController.text, _passwordController.text) as Future<User>?;
                  });
                },
                child: const Text("LOGIN")),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //when setState is called, the program will rebuild the build widget.
        //so, if _futureUser already filled, build will return
        //function buildFutureBuilder
        child: (_futureUser == null) ? buildLoginFrom() : buildFutureBuilder(),
      ),
    );
  }
}
