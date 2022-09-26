//custom_purple.dart
import 'package:flutter/material.dart'; 
class CustomPurple { 
  static const MaterialColor kToDark = MaterialColor(
    0xff6c15cf, // 0% comes in here, this will be color picked if no shade is
    // selected when defining a Color property which does not require a swatch.
    <int, Color>{
      50: Color(0xff6113ba ),//10%
      100: Color(0x005611a6),//20%
      200: Color(0x004c0f91),//30%
      300: Color(0xff410d7c),//40%
      400: Color(0xff360b68),//50%
      500: Color(0xff2b0853),//60%
      600: Color(0xff20063e),//70%
      700: Color(0xff160429),//80%
      800: Color(0xff0b0215),//90%
      900: Color(0xff000000),//100%
    }, 
  ); 
}