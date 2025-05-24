class PartEntity {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String compatibleModel;
  final String imageUrl;
  final int stockQuantity;
  final Map<String, String> specifications;

  const PartEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.compatibleModel,
    required this.imageUrl,
    required this.stockQuantity,
    required this.specifications,
  });

  bool get inStock => stockQuantity > 0;
}
