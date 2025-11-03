// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pokemon _$PokemonFromJson(Map<String, dynamic> json) => _Pokemon(
  id: json['id'] as String,
  name: json['name'] as String,
  types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
  imageUrl: json['imageUrl'] as String,
  isFavorite: json['isFavorite'] as bool? ?? false,
  description: json['description'] as String? ?? '',
  weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
  height: (json['height'] as num?)?.toDouble() ?? 0.0,
  abilities:
      (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  category: json['category'] as String? ?? '',
  maleRatio: (json['maleRatio'] as num?)?.toDouble() ?? 0.0,
  femaleRatio: (json['femaleRatio'] as num?)?.toDouble() ?? 0.0,
  weaknesses:
      (json['weaknesses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  stats: (json['stats'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
);

Map<String, dynamic> _$PokemonToJson(_Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'types': instance.types,
  'imageUrl': instance.imageUrl,
  'isFavorite': instance.isFavorite,
  'description': instance.description,
  'weight': instance.weight,
  'height': instance.height,
  'abilities': instance.abilities,
  'category': instance.category,
  'maleRatio': instance.maleRatio,
  'femaleRatio': instance.femaleRatio,
  'weaknesses': instance.weaknesses,
  'stats': instance.stats,
};
