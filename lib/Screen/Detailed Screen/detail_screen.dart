import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Components/configration.dart';
import 'package:shopify/Screen/Detailed%20Screen/controllers.dart';
import 'package:shopify/Screen/Home%20Screen/Components/controllers.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/app_bar_widget.dart';
import 'package:shopify/Screen/Home%20Screen/Widgets/product_card.dart';
import 'package:shopify/Screen/Cart%20Screen/cart_list_controller.dart';
import 'package:shopify/Screen/Home%20Screen/home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Products productlist;
  DetailScreen({Key? key, required this.productlist}) : super(key: key);
  final colorcontroller = Get.find<Colorcontroller>();
  final cartcontroller = Get.find<CartController>();
  final indexcontroller = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    double borderradius = 32;

    return Scaffold(
      appBar: detailpageappbar(),
      body: SingleChildScrollView(
        child: Container(
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
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                width: double.infinity,
                decoration: boxDecoration(borderradius, white),
                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(parent: null),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        nametxt("Color"),
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          height: 55,
                          child: coloricon(),
                        ),
                        nametxt("Details"),
                        Text(
                          productlist.detail,
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0),
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: twobutton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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

//color choice button widget
  Widget coloricon() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: colorlist.length,
      itemBuilder: (context, index) {
        return GetBuilder<Colorcontroller>(
          builder: (controller) {
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
              ),
            );
          },
        );
      },
    );
  }

//add to cart and buy now button widget
  Widget twobutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
              primary: backgroundgray,
              onPrimary: Colors.black.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )),
          onPressed: () {
            productlist.cartAdded.value
                ? print(cartcontroller.cartlist)
                : cartcontroller.cartlist.add(productlist);
            productlist.cartAdded.value
                ? Get.snackbar(
                    "Already in Cart",
                    "This item has already in your cart",
                    snackPosition: SnackPosition.BOTTOM
                  )
                : Get.snackbar(
                    "Added in Cart",
                    "This item is added in your cart",
                    snackPosition: SnackPosition.BOTTOM
                  );

            productlist.cartAdded = true.obs;
          },
          child: Text(
            "Add to Cart",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
              primary: primary,
              onPrimary: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )),
          onPressed: () {},
          child: Text(
            "Buy Now",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

//appbar widget
  detailpageappbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: black,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primary,
          )),
      title: Container(
        alignment: Alignment.center,
        width: 350,
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
        GetX<CartController>(
          builder: (controller) {
            return Center(
              child: controller.cartlist.length > 0
                  ? Text(
                      controller.cartlist.length.toString(),
                      style: TextStyle(
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(
                      width: 0,
                    ),
            );
          },
        ),
        IconButton(
            onPressed: () {
              indexcontroller.updateindex(2);
              Get.to(
                HomeScreen(),
              );
            },
            icon: Icon(
              Icons.shopping_bag_sharp,
              color: primary,
            )),
      ],
    );
  }
}

const colorlist = [Colors.blue, Colors.pink, Colors.orange];
