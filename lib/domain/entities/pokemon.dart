import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    required String id,
    required String name,
    required List<String> types,
    required String imageUrl,
    @Default(false) bool isFavorite,
    @Default('') String description,
    @Default(0.0) double weight,
    @Default(0.0) double height,
    @Default([]) List<String> abilities,
    @Default('') String category,
    @Default(0.0) double maleRatio,
    @Default(0.0) double femaleRatio,
    @Default([]) List<String> weaknesses,
    Map<String, int>? stats,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}