import '../entities/porsche_model.dart';

abstract class PorscheRepository {
  Future<List<PorscheModelEntity>> getModels();
  Future<List<PorscheModelEntity>> getModelsByCategory(String category);
  Future<PorscheModelEntity?> getModelById(String id);
  Future<List<String>> getCategories();
}
