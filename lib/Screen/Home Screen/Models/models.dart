//brands Name Model
import 'package:get/get.dart';

class BrandNameModel {
  String name;
  String img;
  BrandNameModel({
    required this.name,
    required this.img,
  });
}

List<BrandNameModel> brandName = [
  BrandNameModel(name: "Xiaomi", img: "assets/brandicon/1.png"),
  BrandNameModel(name: "Anker", img: "assets/brandicon/2.png"),
  BrandNameModel(name: "Baseus", img: "assets/brandicon/3.png"),
  BrandNameModel(name: "Audionic", img: "assets/brandicon/4.png"),
  BrandNameModel(name: "Telemart", img: "assets/brandicon/5.png"),
  BrandNameModel(name: "Dr Dre", img: "assets/brandicon/6.png"),
  BrandNameModel(name: "PITAKA", img: "assets/brandicon/7.png"),
  BrandNameModel(name: "RiverSong", img: "assets/brandicon/8.png"),
  BrandNameModel(name: "Realme", img: "assets/brandicon/9.png"),
  BrandNameModel(name: "Oppo", img: "assets/brandicon/10.png"),
];

//Product Item
class Products {
  String name;
  double price;
  String img;
  int star;
  String detail;

  Products(
      {required this.name,
      required this.price,
      required this.img,
      required this.star,
      required this.detail});
  RxBool isfavorite = false.obs;
  RxBool cartAdded = false.obs;
  num quantity = 1;
}

List<Products> product = [
  Products(
    name: "Bose Headphone",
    price: 199,
    img: "assets/images/headphone.png",
    star: 4,
    detail:
        "Type: Stereo headphone with Mic \nBluetooth version: 4.2-5.0 \nOperation Distance: 10m;Plug Type: 3.5mm \nColor:White, Green, Blue, Black, Red (Optional) \nSupport:Bluetooth, Aux in, TF Card, FM radio",
  ),
  Products(
    name: "Sony Watch",
    price: 249,
    img: "assets/images/watch.png",
    star: 5,
    detail:
        "Name: Sony Watch \nColorModel:XPAW002 \nBody Dimension:43*35mm . Thickness = 10 . 2mm \nBand Dimension:Width = 20mm , Unfolded length252mmWeight:52g ( Including strap ) \nMaterial:Metal- + PC / ABS + Liquid silicone rubber \nDisplay:1 . 57inch HD Screen \nBattery Capacity:270mAh \nBattery LifeDaily:Mode 7-day , Basic mode10-day \nCharge:Magnetic Charging cable \nBluetooth Version:V5 . 0",
  ),
  Products(
    name: "AKG Headphone",
    price: 299,
    img: "assets/images/headphone2.png",
    star: 4,
    detail:
        "Type: Stereo headphone with Mic \nBluetooth version: 4.2-5.0 \nOperation Distance: 10m;Plug Type: 3.5mm \nColor:White, Green, Blue, Black, Red (Optional) \nSupport:Bluetooth, Aux in, TF Card, FM radio",
  ),
  Products(
    name: "Sony Headphone",
    price: 329.99,
    img: "assets/images/headphone3.png",
    star: 3,
    detail:
        "Type: Stereo headphone with Mic \nBluetooth version: 4.2-5.0 \nOperation Distance: 10m;Plug Type: 3.5mm \nColor:White, Green, Blue, Black, Red (Optional) \nSupport:Bluetooth, Aux in, TF Card, FM radio",
  ),
  Products(
    name: "Bose Headphone",
    price: 299,
    img: "assets/images/21.png",
    star: 4,
    detail:
        "Type: Stereo headphone with Mic \nBluetooth version: 4.2-5.0 \nOperation Distance: 10m;Plug Type: 3.5mm \nColor:White, Green, Blue, Black, Red (Optional) \nSupport:Bluetooth, Aux in, TF Card, FM radio",
  ),
  Products(
    name: "Sony Watch",
    price: 149,
    img: "assets/images/22.png",
    star: 5,
    detail:
        "Name: Sony Watch \nColorModel:XPAW002 \nBody Dimension:43*35mm . Thickness = 10 . 2mm \nBand Dimension:Width = 20mm , Unfolded length252mmWeight:52g ( Including strap ) \nMaterial:Metal- + PC / ABS + Liquid silicone rubber \nDisplay:1 . 57inch HD Screen \nBattery Capacity:270mAh \nBattery LifeDaily:Mode 7-day , Basic mode10-day \nCharge:Magnetic Charging cable \nBluetooth Version:V5 . 0",
  ),
  Products(
    name: "AKG Headphone",
    price: 349,
    img: "assets/images/23.png",
    star: 4,
    detail:
        "Type: Stereo headphone with Mic \nBluetooth version: 4.2-5.0 \nOperation Distance: 10m;Plug Type: 3.5mm \nColor:White, Green, Blue, Black, Red (Optional) \nSupport:Bluetooth, Aux in, TF Card, FM radio",
  ),
  Products(
    name: "Sony Headphone",
    price: 429.99,
    img: "assets/images/24.png",
    star: 3,
    detail:
        "Type: Stereo headphone with Mic \nBluetooth version: 4.2-5.0 \nOperation Distance: 10m;Plug Type: 3.5mm \nColor:White, Green, Blue, Black, Red (Optional) \nSupport:Bluetooth, Aux in, TF Card, FM radio",
  ),
];
