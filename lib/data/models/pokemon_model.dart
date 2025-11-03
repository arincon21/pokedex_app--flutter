class PokemonModel {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final bool isFavorite;
  final String description;
  final double weight;
  final double height;
  final List<String> abilities;
  final String category;
  final double maleRatio;
  final double femaleRatio;
  final List<String> weaknesses;
  final Map<String, int>? stats;

  PokemonModel({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
    this.isFavorite = false,
    this.description = '',
    this.weight = 0.0,
    this.height = 0.0,
    this.abilities = const [],
    this.category = '',
    this.maleRatio = 0.0,
    this.femaleRatio = 0.0,
    this.weaknesses = const [],
    this.stats,
  });

  factory PokemonModel.fromDetailJson(Map<String, dynamic> json, {Map<String, dynamic>? speciesData}) {
    final id = (json['id'] ?? 0).toString().padLeft(3, '0');
    final types = <String>[];
    
    if (json['types'] is List) {
      for (final type in json['types']) {
        if (type is Map && type['type'] is Map) {
          final name = type['type']['name']?.toString();
          if (name != null) types.add(_translateType(name));
        }
      }
    }

    final sprites = json['sprites'] as Map<String, dynamic>?;
    final other = sprites?['other'] as Map<String, dynamic>?;
    final artwork = other?['official-artwork'] as Map<String, dynamic>?;
    
    final image = artwork?['front_default']?.toString() ?? 
                 sprites?['front_default']?.toString() ?? '';

    // Parse weight and height (API provides in hectograms and decimetres)
    final weightValue = (json['weight'] ?? 0) / 10.0; // Convert to kg
    final heightValue = (json['height'] ?? 0) / 10.0; // Convert to meters

    // Parse abilities
    final abilitiesList = <String>[];
    if (json['abilities'] is List) {
      for (final ability in json['abilities']) {
        if (ability is Map && ability['ability'] is Map) {
          final abilityName = ability['ability']['name']?.toString();
          if (abilityName != null) {
            abilitiesList.add(_capitalizeFirst(abilityName.replaceAll('-', ' ')));
          }
        }
      }
    }

    // Parse stats
    final statsMap = <String, int>{};
    if (json['stats'] is List) {
      for (final stat in json['stats']) {
        if (stat is Map && stat['stat'] is Map) {
          final statName = stat['stat']['name']?.toString();
          final baseStat = stat['base_stat'] as int?;
          if (statName != null && baseStat != null) {
            statsMap[statName] = baseStat;
          }
        }
      }
    }

    // Parse species data if available
    String description = '';
    String category = '';
    double maleRatio = 0.0;
    double femaleRatio = 0.0;

    if (speciesData != null) {
      // Get Spanish description
      if (speciesData['flavor_text_entries'] is List) {
        for (final entry in speciesData['flavor_text_entries']) {
          if (entry is Map && entry['language'] is Map) {
            if (entry['language']['name'] == 'es') {
              description = (entry['flavor_text'] ?? '')
                  .toString()
                  .replaceAll('\n', ' ')
                  .replaceAll('\f', ' ');
              break;
            }
          }
        }
      }

      // Get Spanish category/genus
      if (speciesData['genera'] is List) {
        for (final genus in speciesData['genera']) {
          if (genus is Map && genus['language'] is Map) {
            if (genus['language']['name'] == 'es') {
              category = (genus['genus'] ?? '').toString();
              break;
            }
          }
        }
      }

      // Calculate gender ratios
      final genderRate = speciesData['gender_rate'];
      if (genderRate != null && genderRate != -1) {
        femaleRatio = (genderRate as int) / 8.0 * 100;
        maleRatio = 100.0 - femaleRatio;
      } else if (genderRate == -1) {
        // Genderless Pokemon
        maleRatio = 0.0;
        femaleRatio = 0.0;
      }
    }

    // Calculate weaknesses based on types
    final weaknesses = _calculateWeaknesses(types);

    return PokemonModel(
      id: id,
      name: _capitalizeFirst((json['name'] ?? '').toString()),
      types: types,
      imageUrl: image,
      description: description,
      weight: weightValue,
      height: heightValue,
      abilities: abilitiesList,
      category: category,
      maleRatio: maleRatio,
      femaleRatio: femaleRatio,
      weaknesses: weaknesses,
      stats: statsMap,
    );
  }

  static String _translateType(String type) {
    const typeTranslations = {
      'grass': 'Planta',
      'poison': 'Veneno',
      'fire': 'Fuego',
      'water': 'Agua',
      'bug': 'Bicho',
      'normal': 'Normal',
      'electric': 'Electrico',
      'ground': 'Tierra',
      'fairy': 'Hada',
      'fighting': 'Lucha',
      'psychic': 'Psíquico',
      'rock': 'Roca',
      'ghost': 'Fantasma',
      'ice': 'Hielo',
      'dragon': 'Dragón',
      'dark': 'Siniestro',
      'steel': 'Acero',
      'flying': 'Volador',
    };
    return typeTranslations[type.toLowerCase()] ?? type;
  }

  static String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static List<String> _calculateWeaknesses(List<String> types) {
    // Simplified weakness calculation based on common type matchups
    final weaknessSet = <String>{};

    for (final type in types) {
      switch (type) {
        case 'Planta':
          weaknessSet.addAll(['Fuego', 'Hielo', 'Veneno', 'Volador', 'Bicho']);
          break;
        case 'Veneno':
          weaknessSet.addAll(['Tierra', 'Psíquico']);
          break;
        case 'Fuego':
          weaknessSet.addAll(['Agua', 'Tierra', 'Roca']);
          break;
        case 'Agua':
          weaknessSet.addAll(['Eléctrico', 'Planta']);
          break;
        case 'Eléctrico':
          weaknessSet.add('Tierra');
          break;
        case 'Hielo':
          weaknessSet.addAll(['Fuego', 'Lucha', 'Roca', 'Acero']);
          break;
        case 'Volador':
          weaknessSet.addAll(['Eléctrico', 'Hielo', 'Roca']);
          break;
        case 'Psíquico':
          weaknessSet.addAll(['Bicho', 'Fantasma', 'Siniestro']);
          break;
      }
    }

    return weaknessSet.toList();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'types': types,
    'imageUrl': imageUrl,
    'isFavorite': isFavorite,
    'description': description,
    'weight': weight,
    'height': height,
    'abilities': abilities,
    'category': category,
    'maleRatio': maleRatio,
    'femaleRatio': femaleRatio,
    'weaknesses': weaknesses,
    'stats': stats,
  };
}
