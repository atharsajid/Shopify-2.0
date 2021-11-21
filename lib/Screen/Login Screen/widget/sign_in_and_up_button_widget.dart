import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Home%20Screen/home_screen.dart';
import 'package:shopify/Screen/Login%20Screen/Sign%20In%20Screen/sign_in_screen.dart';
import 'package:shopify/Screen/Login%20Screen/Sign%20Up%20Screen/sign_up_screen.dart';
import 'package:shopify/Screen/Login%20Screen/components.dart';
import 'package:shopify/Screen/Components/colors.dart';
//Sign in and Sign up btn Class

class SignnInbtn extends StatelessWidget {
  const SignnInbtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          style: signbtn,
          onPressed: () {
            Get.to(const SignIn());
          },
          icon: Icon(
            Icons.person,
            color: white,
          ),
          label: Text(
            "Sign In",
            style: signbtntxt,
          ),
        ),
        OutlinedButton.icon(
          style: signbtn,
          onPressed: () {
            Get.to(const SignUp());
          },
          icon: Icon(
            Icons.person,
            color: white,
          ),
          label: Text(
            "Sign Up",
            style: signbtntxt,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            Get.to(HomeScreen());
          },
          icon: Icon(
            Icons.person_outline_sharp,
            color: white,
          ),
          label: Text(
            "Continue as Guest",
            style: signbtntxt,
          ),
        ),
      ],
    );
  }
}
