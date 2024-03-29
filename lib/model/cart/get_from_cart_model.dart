class CartGetModel {
  CartGetModel({
    required this.id,
    required this.products,
    required this.totalPrice,
    required this.totalDiscount,
  });

  String id;
  List<ProductElement> products;
  int totalPrice;
  dynamic totalDiscount;

  factory CartGetModel.fromJson(Map<String, dynamic> json) => CartGetModel(
        id: json["_id"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        totalPrice: json["totalPrice"],
        totalDiscount: json["totalDiscount"],
      );
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.size,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.id,
  });

  Product product;
  String size;
  int qty;
  int price;
  dynamic discountPrice;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: Product.fromJson(json["product"]),
        size: json["size"],
        qty: json["qty"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        id: json["_id"],
      );
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.offer,
    required this.rating,
    required this.size,
    required this.image,
  });

  String id;
  String name;
  int price;
  dynamic discountPrice;
  int offer;
  String rating;
  List<String> size;
  List<String> image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        offer: json["offer"],
        rating: json["rating"],
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
      );
}
