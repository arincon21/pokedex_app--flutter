import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/exceptions.dart';
import '../models/pokemon_model.dart';

// Helper function to parse in a separate isolate
PokemonModel _parsePokemonDetails(Map<String, dynamic> data) {
  return PokemonModel.fromDetailJson(data['details'], speciesData: data['species']);
}

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons(int offset, int limit);
  Future<PokemonModel> getPokemonDetails(String name);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PokemonModel>> getPokemons(int offset, int limit) async {
    try {
      final response = await dio.get(
        ApiConstants.pokemonEndpoint,
        queryParameters: {'offset': offset, 'limit': limit},
      );
      final results = response.data['results'] as List;
      
      // Fetch all pokemon details in parallel
      final futures = results.map((pokemon) {
        return getPokemonDetails(pokemon['name'] as String);
      }).toList();
      
      return await Future.wait(futures);
    } on DioException catch (e) {
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
      throw ServerException('Failed to fetch pokemons list: ${e.toString()}');
    }
  }

  @override
  Future<PokemonModel> getPokemonDetails(String name) async {
    try {
      final response = await dio.get(
        ApiConstants.getPokemonDetailsEndpoint(name.toLowerCase()),
      );
      
      // Fetch species data for additional information
      Map<String, dynamic>? speciesData;
      try {
        final speciesResponse = await dio.get(
          ApiConstants.getPokemonSpeciesEndpoint(response.data['id'].toString()),
        );
        speciesData = speciesResponse.data;
      } catch (e) {
        // If species data fails, continue without it
        if (kDebugMode) {
          print('Warning: Could not fetch species data for ${name}: $e');
        }
      }
      
      // Use compute to parse in a separate isolate
      return await compute(_parsePokemonDetails, {
        'details': response.data,
        'species': speciesData,
      });
    } on DioException catch (e) {
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
      throw ServerException('Failed to fetch pokemon details for ${name}: ${e.toString()}');
    }
  }
}
