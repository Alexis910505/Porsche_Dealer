class PorscheModelEntity {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> galleryImages;
  final String category;
  final Map<String, String> specifications;
  final List<String> features;
  final double price;

  const PorscheModelEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.galleryImages,
    required this.category,
    required this.specifications,
    required this.features,
    required this.price,
  });
}
