class PorschePartEntity {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final String compatibleModel;
  final double price;
  final Map<String, String> specifications;
  final bool inStock;
  final int stockQuantity;

  const PorschePartEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.compatibleModel,
    required this.price,
    required this.specifications,
    required this.inStock,
    required this.stockQuantity,
  });
}
