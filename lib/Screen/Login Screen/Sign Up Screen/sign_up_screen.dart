import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Components/configration.dart';
import 'package:shopify/Screen/Login%20Screen/Sign%20In%20Screen/sign_in_screen.dart';
import 'package:shopify/Screen/Login%20Screen/components.dart';
import 'package:shopify/Screen/Login%20Screen/widget/logo_and_slogan_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = "";
  String email = "";
  String password = "";
  double heightgap = 20;
  bool passwrd = true;
  bool istextfieldempty = false;

  TextEditingController emailtxt = TextEditingController();
  TextEditingController usernametxt = TextEditingController();
  TextEditingController passwordtxt = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailtxt.addListener(() => setState(() {}));
    usernametxt.addListener(() => setState(() {}));
    passwordtxt.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundimage,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: logoSlogan(name, iconimg, slogan),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  usernm(),
                  SizedBox(
                    height: heightgap,
                  ),
                  emal(),
                  SizedBox(
                    height: heightgap,
                  ),
                  pass(),
                  SizedBox(
                    height: heightgap,
                  ),
                  repassword(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: heightgap),
                    child: signbotton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//email textfield
  Widget usernm() {
    return TextField(
      onChanged: (value) {
        setState(() {
          username = value;
        });
      },
      keyboardType: TextInputType.name,
      controller: usernametxt,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.person,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Username",
        hintStyle: txtwhite,
        suffixIcon: usernametxt.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      usernametxt.clear();
                    },
                  );
                },
                icon: Icon(
                  Icons.cancel,
                  color: white,
                ),
              ),
      ),
    );
  }

//email textfield
  Widget emal() {
    return TextField(
      onChanged: (value) {
        setState(() {
          email = value;
        });
      },
      keyboardType: TextInputType.emailAddress,
      controller: emailtxt,
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.email,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Email",
        hintStyle: txtwhite,
        suffixIcon: emailtxt.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  setState(
                    () {
                      emailtxt.clear();
                    },
                  );
                },
                icon: Icon(
                  Icons.cancel,
                  color: white,
                ),
              ),
      ),
    );
  }

//password textfield
  Widget pass() {
    return TextField(
      controller: passwordtxt,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.lock,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Password",
        hintStyle: txtwhite,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwrd = !passwrd;
            });
          },
          icon: passwrd
              ? Icon(
                  Icons.visibility,
                  color: white,
                )
              : Icon(
                  Icons.visibility_off,
                  color: white,
                ),
        ),
      ),
      obscureText: passwrd,
    );
  }

//password textfield
  Widget repassword() {
    return TextField(
      style: txtwhite,
      decoration: InputDecoration(
        filled: true,
        fillColor: white.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.lock,
          color: white,
        ),
        enabledBorder: outlinein,
        focusedBorder: outlinein,
        hintText: "Re-enter Password",
        hintStyle: txtwhite,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwrd = !passwrd;
            });
          },
          icon: passwrd
              ? Icon(
                  Icons.visibility,
                  color: white,
                )
              : Icon(
                  Icons.visibility_off,
                  color: white,
                ),
        ),
      ),
      obscureText: passwrd,
    );
  }

//sign in button which press to continue home screen
  Widget signbotton() {
    return OutlinedButton.icon(
      style: signbtn,
      onPressed: () {
        setState(() {
          if (emailtxt.text.isNotEmpty &&
              usernametxt.text.isNotEmpty &&
              passwordtxt.text.isNotEmpty) {
            successmsg(context);
          } else {
            istextfieldempty = true;
          }
        });
      },
      icon: Icon(
        Icons.person,
        color: white,
      ),
      label: Text(
        "Sign Up",
        style: signbtntxt,
      ),
    );
  }

//white text style for textfied hint text
  final txtwhite = TextStyle(
    color: white,
  );
//Pop up dialog for successful account created
  void successmsg(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text("Congratulations!"),
            content: const Text("Your account has been created successfuly."),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Back"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  });
                },
                child: const Text(
                  "Sign In",
                ),
              ),
            ],
          ));
}
