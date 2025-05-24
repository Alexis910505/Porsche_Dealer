import '../entities/part_entity.dart';

abstract class PartRepository {
  Future<List<PartEntity>> getAllParts();
  Future<List<PartEntity>> getPartsByCategory(String category);
  Future<List<PartEntity>> getPartsByModel(String model);
  Future<PartEntity?> getPartById(String id);
  Future<List<String>> getCategories();
  Future<List<String>> getCompatibleModels();
  Future<void> updateStock(String partId, int quantity);
}
