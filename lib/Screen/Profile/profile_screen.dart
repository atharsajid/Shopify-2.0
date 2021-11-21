import 'package:flutter/material.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Components/configration.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(dpimg), fit: BoxFit.cover),
            ),
          ),
          Text(
            "Muhammad Athar",
            style: TextStyle(
              color: primary,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Email: athersajid620@gmail.com",
            style: TextStyle(
              color: black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Phone: 03402110862",
            style: TextStyle(
              color: black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Address: House No A-100,Street 04, Bahadurabad, Karachi",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
