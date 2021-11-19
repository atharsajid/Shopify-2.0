import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/Screen/Components/colors.dart';
import 'package:shopify/Screen/Home%20Screen/Models/models.dart';

class BrandNameController extends GetxController {
  var brandnamelist = <BrandNameModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() {
    brandnamelist.value = brandName;
  }
}
//main product controller
class ProductController extends GetxController {
  var productlist = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchproduct();
  }

  void fetchproduct() {
    productlist.value = product;
  }
}

//colot controller
class FavIconColor extends GetxController {

  var isfavorite = false.obs;


}

