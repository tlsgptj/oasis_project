class Gifticon {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Gifticon({required this.id, required this.name, required this.description, required this.price, required this.imageUrl});

  factory Gifticon.fromJson(Map<String, dynamic> json) {
    return Gifticon(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['image_url'],
    );
  }
}
