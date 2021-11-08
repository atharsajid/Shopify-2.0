import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Components/configration.dart';

String logoimg = "assets/images/icon1.png";
String companyname = "Shopify";

appbar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    foregroundColor: black,
    title: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconimg,
            color: primary,
            scale: 3,
          ),
          Text(
            companyname,
            style: TextStyle(
                fontSize: 24,
                color: primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: black,
        ),
      ),
    ],
  );
}
