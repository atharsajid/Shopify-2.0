import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dp.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Text(
              "Muhammad Athar",
              style: TextStyle(
                color: white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
