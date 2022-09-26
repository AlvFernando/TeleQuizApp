import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'custom_purple.dart';

class ProfileWidget extends StatelessWidget {
  final String username;
  final String firstName;
  final String lastName;
  final String description;
  final String avatarPath;

  const ProfileWidget({
    Key? key,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.avatarPath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 50,),
        CircleAvatar(
          radius: 70,
          backgroundColor: CustomPurple.kToDark,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                '${dotenv.env['API_BASE_URL']!}profile_picture/'
                    '${dotenv.env['API_KEY']!}/$avatarPath'
            ),
            radius: 65,
          ),
        ),
        IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.camera_alt_rounded),
        ),
        //
        const SizedBox(height: 30,),
        Text(username,style: const TextStyle(fontSize: 22),),
        const Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.black
        ),
        const SizedBox(height: 50,),
        Text('$firstName $lastName',style: const TextStyle(fontSize: 22),),
        const Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.black
        ),
        const SizedBox(height: 70,),
        Text(description,style: const TextStyle(fontSize: 22),),
      ],
    );
  }
}
