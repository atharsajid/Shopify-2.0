import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Components/controllers.dart';

class BranName extends StatefulWidget {
  const BranName({Key? key}) : super(key: key);

  @override
  _BranNameState createState() => _BranNameState();
}

class _BranNameState extends State<BranName> {
  var isbrandselected = 0;
  final brandnamecont = Get.put(BrandNameController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: brandnamecont.brandnamelist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isbrandselected = index;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 25, bottom: 10),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: isbrandselected==index?boxshadow2:boxshadow,
                      ),
                      height: 70,
                      width: 120,
                      child: Image.asset(
                        brandnamecont.brandnamelist[index].img,
                        color: isbrandselected == index ? black : grey,
                        scale: 4,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      height: 3,
                      width: 80,
                      color: isbrandselected == index
                          ? black
                          : black.withOpacity(0),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
