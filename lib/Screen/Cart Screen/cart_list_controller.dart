import 'package:get/get.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';

class CartController extends GetxController {
  var cartlist = <Products>[].obs;

  addtocart(Products product) {
    cartlist.add(product);
  }

  //quantiy in cart
  var quantity = 1;
  quantityupdate(int q) {
    quantity = q;
    update();
  }
}

class IndexController extends GetxController {
  var currentind = 0;

  updateindex(int index) {
    currentind = index;
    update();
  }
}
