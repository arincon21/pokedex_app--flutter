import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource _remoteDataSource;

  PokemonRepositoryImpl({required PokemonRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Pokemon>> getPokemons({int offset = 0, int limit = 20}) async {
    final pokemons = await _remoteDataSource.getPokemons(offset, limit);
    return pokemons.map((p) => Pokemon(
      id: p.id,
      name: p.name,
      types: p.types,
      imageUrl: p.imageUrl,
      isFavorite: p.isFavorite,
      description: p.description,
      weight: p.weight,
      height: p.height,
      abilities: p.abilities,
      category: p.category,
      maleRatio: p.maleRatio,
      femaleRatio: p.femaleRatio,
      weaknesses: p.weaknesses,
      stats: p.stats,
    )).toList();
  }

  @override
  Future<Pokemon> getPokemonById(String id) async {
    try {
      final pokemon = await _remoteDataSource.getPokemonDetails(id);
      return Pokemon(
        id: pokemon.id,
        name: pokemon.name,
        types: pokemon.types,
        imageUrl: pokemon.imageUrl,
        isFavorite: pokemon.isFavorite,
        description: pokemon.description,
        weight: pokemon.weight,
        height: pokemon.height,
        abilities: pokemon.abilities,
        category: pokemon.category,
        maleRatio: pokemon.maleRatio,
        femaleRatio: pokemon.femaleRatio,
        weaknesses: pokemon.weaknesses,
        stats: pokemon.stats,
      );
    } catch (e) {
      throw Exception('Pokemon not found');
    }
  }

  @override
  Future<void> toggleFavorite(String id) async {
    // Persistencia de favoritos no implementada en este ejercicio
    await Future.delayed(const Duration(milliseconds: 100));
  }
}