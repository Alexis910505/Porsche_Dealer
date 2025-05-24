abstract class FavoriteRepository {
  /// Verifica si un modelo está en favoritos
  Future<bool> isFavorite(String modelId);

  /// Agrega un modelo a favoritos
  Future<void> addFavorite(String modelId);

  /// Remueve un modelo de favoritos
  Future<void> removeFavorite(String modelId);

  /// Obtiene la lista de IDs de modelos favoritos
  Future<List<String>> getFavorites();
}
