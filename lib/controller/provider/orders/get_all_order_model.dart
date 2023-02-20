class GetOrderModel {
  GetOrderModel({
    required this.id,
    required this.userid,
    required this.products,
    required this.paymentType,
    required this.paymentStatus,
    required this.orderStatus,
    required this.fullName,
    required this.phone,
    required this.pin,
    required this.state,
    required this.place,
    required this.address,
    required this.landMark,
    required this.orderDate,
    required this.deliveryDate,
    required this.cancelDate,
    required this.totalPrice,
    required this.totalDiscount,
  });

  String id;
  String userid;
  List<ProductElement> products;
  String paymentType;
  bool paymentStatus;
  String orderStatus;
  String fullName;
  String phone;
  String pin;
  String state;
  String place;
  String address;
  String landMark;
  DateTime orderDate;
  DateTime deliveryDate;
  dynamic cancelDate;
  int totalPrice;
  int totalDiscount;

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        id: json["_id"],
        userid: json["userid"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        paymentType: json["paymentType"],
        paymentStatus: json["paymentStatus"],
        orderStatus: json["orderStatus"],
        fullName: json["fullName"],
        phone: json["phone"],
        pin: json["pin"],
        state: json["state"],
        place: json["place"],
        address: json["address"],
        landMark: json["landMark"],
        orderDate: DateTime.parse(json["orderDate"]),
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        cancelDate: json["cancelDate"],
        totalPrice: json["totalPrice"],
        totalDiscount: json["totalDiscount"],
      );
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.qty,
    required this.price,
    required this.discountPrice,
    required this.size,
    required this.id,
  });

  Product product;
  int qty;
  int price;
  int discountPrice;
  String size;
  String id;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: Product.fromJson(json["product"]),
        qty: json["qty"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        size: json["size"],
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
    required this.category,
  });

  String id;
  String name;
  int price;
  int discountPrice;
  int offer;
  String rating;
  List<String> size;
  List<String> image;
  String category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        offer: json["offer"],
        rating: json["rating"],
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        category: json["category"],
      );
}
