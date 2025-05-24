import '../../domain/entities/porsche_part.dart';

class PorschePart extends PorschePartEntity {
  const PorschePart({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.category,
    required super.compatibleModel,
    required super.price,
    required super.specifications,
    required super.inStock,
    required super.stockQuantity,
  });

  factory PorschePart.fromJson(Map<String, dynamic> json) {
    return PorschePart(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      compatibleModel: json['compatibleModel'] as String,
      price: (json['price'] as num).toDouble(),
      specifications: Map<String, String>.from(json['specifications'] as Map),
      inStock: json['inStock'] as bool,
      stockQuantity: json['stockQuantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'compatibleModel': compatibleModel,
      'price': price,
      'specifications': specifications,
      'inStock': inStock,
      'stockQuantity': stockQuantity,
    };
  }
}
