import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Detailed%20Screen/controllers.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/product_card.dart';

class DetailScreen extends StatelessWidget {
  final Products productlist;
  const DetailScreen({Key? key, required this.productlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorcontroller = Get.put(
      Colorcontroller(),
    );
    double borderradius = 32;
    return Scaffold(
      appBar: appbar(),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: boxDecoration(borderradius, backgroundgray),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: decoration(),
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                children: [
                  Image.asset(
                    productlist.img,
                    height: 200,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 40,
                    child: star(),
                  ),
                  nametxt(productlist.name),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  price(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                width: double.infinity,
                decoration: boxDecoration(borderradius, white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nametxt("Color"),
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 50,
                        child: coloricon()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//widgets call in above class are following below

//Name text widget
  Widget nametxt(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }

//star widget
  Widget star() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Icon(
              index < productlist.star ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 25,
            )
          ],
        );
      },
    );
  }

//grey rounded background
  BoxDecoration boxDecoration(double borderradius, Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderradius),
        topRight: Radius.circular(borderradius),
      ),
    );
  }

//for product background imge
  decoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(productbackimg),
        colorFilter: ColorFilter.mode(
          white.withOpacity(0.5),
          BlendMode.dstIn,
        ),
        fit: BoxFit.contain,
      ),
    );
  }

//Price widget
  price() {
    return Text(
      "\$${productlist.price}",
      style: TextStyle(
        color: primary,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget coloricon() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: colorlist.length,
      itemBuilder: (context, index) {
        return GetBuilder<Colorcontroller>(builder: (controller) {
          return Container(
              margin: EdgeInsets.only(right: 2),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    color: controller.isSelected == index
                        ? Colors.grey.withOpacity(0.4)
                        : Colors.white.withOpacity(0.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  controller.updatecolor(index);
                },
                icon: Icon(
                  Icons.circle,
                  color: colorlist[index],
                ),
              ));
        });
      },
    );
  }
}

const colorlist = [Colors.blue, Colors.pink, Colors.orange];
