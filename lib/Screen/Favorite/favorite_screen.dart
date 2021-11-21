import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Detailed%20Screen/detail_screen.dart';
import 'package:shopify/Screen/Favorite/controller.dart';
import 'package:shopify/Screen/Home%20Screen/Components/controllers.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  double borderradius = 32;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundgray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderradius),
          topRight: Radius.circular(borderradius),
        ),
      ),
      child: Column(
        children: [
          FavCar(),
        ],
      ),
    );
  }
}

class FavCar extends StatelessWidget {
  FavCar({Key? key}) : super(key: key);
  final productcontroller = Get.find<FavoriteController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.all(10),
          physics: const ScrollPhysics(parent: null),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: productcontroller.favoritelist.length,
          itemBuilder: (context, index) => ProductItemCard(
            //function to goto Detail screen
            press: () => Get.to(
              DetailScreen(
                productlist: productcontroller.favoritelist[index],
              ),
            ),
            index: index,
            //to change favorite icon color
            isselect: productcontroller.favoritelist[index].isfavorite,
            //to make usable ProductData
            productitem: productcontroller.favoritelist[index],
          ),
        ),
      ),
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final Products productitem;
  final dynamic isselect;
  final int index;
  final dynamic press;

  ProductItemCard({
    Key? key,
    required this.productitem,
    required this.isselect,
    required this.index,
    required this.press,
  }) : super(key: key);
  Color favorite = grey;

  @override
  Widget build(BuildContext context) {
    final productlist = Get.find<FavoriteController>();
    final productcontroller = Get.find<ProductController>();
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: boxdecoration(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    productitem.img,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    productitem.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "\$${productitem.price}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 30,
                    child: star()),
              ],
            ),
            Align(
              alignment: const Alignment(1, -1),
              child: IconButton(
                onPressed: () {
                  productlist.favoritelist.removeAt(index);
                  productcontroller.productlist[index].isfavorite.toggle();
                },
                icon: Icon(
                  Icons.delete,
                  color: isselect.value ? grey : grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget star() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Icon(
              index < productitem.star ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            ),
          ],
        );
      },
    );
  }
}

String productbackimg = "assets/images/back3.png";
BoxDecoration boxdecoration() {
  return BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: boxshadow2,
    image: DecorationImage(
      scale: 1,
      image: AssetImage(productbackimg),
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(white.withOpacity(0.7), BlendMode.lighten),
    ),
  );
}
