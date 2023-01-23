class CarousalModel {
  final String imagePath;
  final String offer;
  final String id;
  CarousalModel({
    required this.imagePath,
    required this.offer,
    required this.id,
  });

  factory CarousalModel.fromJson(Map<String, dynamic> json) {
    return CarousalModel(
      imagePath: json['image'],
      offer: json['offer'],
      id: json['_id'],
    );
  }
}
