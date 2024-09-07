class Coffee {
  final String name;
  final String description;
  final String image; 
  final double price;

  Coffee({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      name: json['name'],
      description: json['description'],
      image: json['image_url'], 
      price: (json['price'] as num).toDouble(),
    );
  }
}
