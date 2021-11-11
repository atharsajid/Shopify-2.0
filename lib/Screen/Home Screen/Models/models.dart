//brands Name Model
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
  Products({
    required this.name,
    required this.price,
    required this.img,
    required this.star,
  });
}

List<Products> product = [
  Products(
    name: "Bose Headphone",
    price: 199,
    img: "assets/images/headphone.png",
    star: 4,
  ),
  Products(
    name: "Sony Watch",
    price: 249,
    img: "assets/images/watch.png",
    star: 5,
  ),
  Products(
    name: "AKG Headphone",
    price: 299,
    img: "assets/images/headphone2.png",
    star: 4,
  ),
  Products(
    name: "Sony Headphone",
    price: 329.99,
    img: "assets/images/headphone3.png",
    star: 3,
  ),
];
