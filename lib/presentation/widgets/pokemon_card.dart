import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String number;
  final String name;
  final List<String> types;
  final String imageUrl;
  final bool isFavorite;
  final Function()? onFavoritePressed;
  final Function()? onTap;

  const PokemonCard({
    super.key,
    required this.number,
    required this.name,
    required this.types,
    required this.imageUrl,
    this.isFavorite = false,
    this.onFavoritePressed,
    this.onTap,
  });

  String _typeToEnglish(String spanishType) {
    switch (spanishType.toLowerCase()) {
      case 'acero': return 'steel';
      case 'agua': return 'water';
      case 'bicho': return 'bug';
      case 'dragón': return 'dragon';
      case 'dragon': return 'dragon';
      case 'electrico': return 'electric';
      case 'fantasma': return 'ghost';
      case 'fuego': return 'fire';
      case 'hada': return 'fairy';
      case 'hielo': return 'ice';
      case 'lucha': return 'fighting';
      case 'normal': return 'normal';
      case 'planta': return 'grass';
      case 'psíquico': return 'psychic';
      case 'psiquico': return 'psychic';
      case 'roca': return 'rock';
      case 'siniestro': return 'dark';
      case 'tierra': return 'ground';
      case 'veneno': return 'poison';
      case 'volador': return 'flying';
      default: return spanishType.toLowerCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgImagePath = types.isNotEmpty
        ? 'assets/images/bg-types/Type=${_typeToEnglish(types.first)}.png'
        : null;

    return GestureDetector(
      onTap: onTap,
      child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: bgImagePath != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImagePath),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(color: Colors.grey.shade100),
        child: Stack(
          children: [
            // contenido principal (nombre en Title Case)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nº$number', style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(_toTitleCase(name), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(children: types.map((t) => _buildTypeChip(t)).toList()),
                ],
              ),
            ),

            // favorito con diseño circular (borde blanco y círculo interior)
            Positioned(
              right: 8,
              top: 8,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onFavoritePressed,
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFavorite ? Colors.grey.shade700 : Colors.grey.shade700.withOpacity(0.7),
                        ),
                        child: Center(
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // imagen del pokemon
            Positioned(
              right: 35,
              bottom: 15,
              child: SizedBox(
                width: 80,
                height: 80,
                child: imageUrl.toLowerCase().startsWith('http')
                    ? Image.network(imageUrl, fit: BoxFit.contain, errorBuilder: (c, e, s) => const SizedBox.shrink())
                    : Image.asset(imageUrl, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  String _translateType(String type) {
    switch (type.toLowerCase()) {
      case 'steel': return 'Acero';
      case 'water': return 'Agua';
      case 'bug': return 'Bicho';
      case 'dragon': return 'Dragon';
      case 'electric': return 'Electrico';
      case 'ghost': return 'Fantasma';
      case 'fire': return 'Fuego';
      case 'fairy': return 'Hada';
      case 'ice': return 'Hielo';
      case 'fighting': return 'Lucha';
      case 'normal': return 'Normal';
      case 'grass': return 'Planta';
      case 'psychic': return 'Psíquico';
      case 'rock': return 'Roca';
      case 'dark': return 'Siniestro';
      case 'ground': return 'Tierra';
      case 'poison': return 'Veneno';
      case 'flying': return 'Volador';
      default: return type;
    }
  }

  String _toTitleCase(String input) {
    if (input.trim().isEmpty) return input;
    return input
        .split(' ')
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
        .join(' ');
  }

  Widget _buildTypeChip(String type) {
    final translatedType = _translateType(type);
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: Image.asset(
        'assets/images/types/Type=$translatedType.png',
        height: 28,
        fit: BoxFit.contain,
      ),
    );
  }
}
