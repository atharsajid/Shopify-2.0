import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/configration.dart';
import 'package:shopify/Screen/Login%20Screen/components.dart';
import 'package:shopify/Screen/Login%20Screen/widget/logo_and_slogan_widget.dart';
import 'package:shopify/Screen/Login%20Screen/widget/sign_in_and_up_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundimage,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: logoSlogan(name, iconimg, slogan),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const SignnInbtn(),
            ),
          ],
        ),
      ),
    );
  }
}
