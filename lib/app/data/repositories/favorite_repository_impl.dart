import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  static const String _favoritesKey = 'favorites';
  final SharedPreferences _prefs;

  FavoriteRepositoryImpl(this._prefs);

  @override
  Future<bool> isFavorite(String modelId) async {
    final favorites = await getFavorites();
    return favorites.contains(modelId);
  }

  @override
  Future<void> addFavorite(String modelId) async {
    final favorites = await getFavorites();
    if (!favorites.contains(modelId)) {
      favorites.add(modelId);
      await _prefs.setStringList(_favoritesKey, favorites);
    }
  }

  @override
  Future<void> removeFavorite(String modelId) async {
    final favorites = await getFavorites();
    favorites.remove(modelId);
    await _prefs.setStringList(_favoritesKey, favorites);
  }

  @override
  Future<List<String>> getFavorites() async {
    return _prefs.getStringList(_favoritesKey) ?? [];
  }
}
