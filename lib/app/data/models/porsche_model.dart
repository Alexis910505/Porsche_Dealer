import '../../domain/entities/porsche_model.dart';

class PorscheModel extends PorscheModelEntity {
  const PorscheModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.galleryImages,
    required super.category,
    required super.specifications,
    required super.features,
    required super.price,
  });

  factory PorscheModel.fromJson(Map<String, dynamic> json) {
    return PorscheModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      galleryImages: List<String>.from(json['galleryImages'] as List),
      category: json['category'] as String,
      specifications: Map<String, String>.from(json['specifications'] as Map),
      features: List<String>.from(json['features'] as List),
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'galleryImages': galleryImages,
      'category': category,
      'specifications': specifications,
      'features': features,
      'price': price,
    };
  }
}
