import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/pokemon_remote_datasource.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
// Domain types are accessed directly where needed; repository implementation is
// provided by `pokemonRepositoryProvider` above.

final dioProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json,
  ));
  
  // Reduce logging for better performance
  dio.interceptors.add(LogInterceptor(
    requestBody: false,
    responseBody: false,
  ));
  
  return dio;
});

final pokemonRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return PokemonRemoteDataSourceImpl(dio: dio);
});

final pokemonRepositoryProvider = Provider((ref) {
  final remoteDataSource = ref.watch(pokemonRemoteDataSourceProvider);
  return PokemonRepositoryImpl(remoteDataSource: remoteDataSource);
});
// Pagination is handled in the UI (HomeScreen) using the reposit