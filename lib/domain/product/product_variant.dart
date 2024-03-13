final class ProductVariant {
  final String id;
  final Map<String, String> properties;
  final String? variantDescription;
  final double price;
  final double rating;
  final int? availableQuantity;
  final List<String> images;

  ProductVariant({
    required this.properties,
    required this.id,
    required this.price,
    required this.rating,
    required this.availableQuantity,
    required this.images,
    this.variantDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'properties': properties,
      'variantDescription': variantDescription,
      'price': price,
      'rating': rating,
      'availableQuantity': availableQuantity,
      'images': images,
    };
  }

  factory ProductVariant.fromMap(Map<String, dynamic> map) {
    return ProductVariant(
      id: map['id'] as String,
      properties: map['properties'],
      variantDescription: map['variantDescription'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      availableQuantity: map['availableQuantity'] as int,
      images: map['images'] as List<String>,
    );
  }
}
