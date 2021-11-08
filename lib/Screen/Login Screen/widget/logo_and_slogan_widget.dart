import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';

Widget logoSlogan(String name, String img, String slogan) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 50,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ],
      ),
     const SizedBox(
        height: 30,
      ),
      Text(
        slogan,
        style: TextStyle(
          fontSize: 20,
          color: white,
          letterSpacing: 4,
        ),
      ),
    ],
  );
}
