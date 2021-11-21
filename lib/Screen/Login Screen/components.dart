import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';


final signbtntxt = TextStyle(
  fontSize: 18,
  color: white,
  letterSpacing: 4,
  fontWeight: FontWeight.bold,
);

//Sign in and Sign up button

final signbtn = OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(color: white, width: 2),
    minimumSize: const Size(200, 60),
    primary: white,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ));

//inputfield decoration
final outlinein = OutlineInputBorder(
  borderRadius: BorderRadius.circular(32),
  borderSide: BorderSide(color: white, width: 2),
);

//background image widget
final backgroundimage = BoxDecoration(
  image: DecorationImage(
    image: const AssetImage("assets/images/11.jpg"),
    fit: BoxFit.cover,
    colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
  ),
);

//Account Detail List
List<String> mainlist = [];
List<String> requirekey = ["username", "email", "password"];
List<String> accountData = [];
