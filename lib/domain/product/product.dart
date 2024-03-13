import 'brand.dart';
import 'product_variant.dart';

class Product {
  final String id;
  final String name;
  final Brand brand;
  final String description;
  final List<ProductVariant> variants;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.variants,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand.toMap(),
      'description': description,
      'variants': variants.map((e) => e.toMap()),
    };
  }

  static Product? tryFromMap(Map<String, dynamic>? map) {
    return map == null ? null : Product.fromMap(map);
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      brand: Brand.fromMap(map['brand']),
      description: map['description'] as String,
      variants: map['variants'] as List<ProductVariant>,
    );
  }
}
