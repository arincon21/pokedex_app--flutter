import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/entities/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({Key? key, required this.pokemon}) : super(key: key);

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Planta':
        return Color(0xFF78C850);
      case 'Veneno':
        return Color(0xFFA040A0);
      case 'Fuego':
        return Color(0xFFF08030);
      case 'Agua':
        return Color(0xFF6890F0);
      case 'Psíquico':
        return Color(0xFFF85888);
      case 'Hielo':
        return Color(0xFF98D8D8);
      case 'Volador':
        return Color(0xFFA890F0);
      case 'Bicho':
        return Color(0xFFA8B820);
      case 'Normal':
        return Color(0xFFA8A878);
      case 'Eléctrico':
        return Color(0xFFF8D030);
      case 'Tierra':
        return Color(0xFFE0C068);
      case 'Hada':
        return Color(0xFFEE99AC);
      case 'Lucha':
        return Color(0xFFC03028);
      case 'Roca':
        return Color(0xFFB8A038);
      case 'Fantasma':
        return Color(0xFF705898);
      case 'Dragon':
        return Color(0xFF7038F8);
      case 'Siniestro':
        return Color(0xFF705848);
      case 'Acero':
        return Color(0xFFB8B8D0);
      default:
        return Colors.grey;
    }
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey[700]),
              SizedBox(width: 4),
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Pokemon image
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _getTypeColor(pokemon.types.first),
                        _getTypeColor(pokemon.types.first).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Decorative circle background
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.network(
                          pokemon.imageUrl,
                          height: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.catching_pokemon, size: 200, color: Colors.white);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        pokemon.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            
            // Pokemon information
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and ID
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'N°${pokemon.id}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Type badges
                  Row(
                    children: pokemon.types.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          'assets/images/types/Type=$type.png',
                          height: 32,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: _getTypeColor(type),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  
                  // Description
                  if (pokemon.description.isNotEmpty)
                    Text(
                      pokemon.description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                        height: 1.5,
                      ),
                    ),
                  SizedBox(height: 24),
                  
                  // Weight and Height
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          'Peso',
                          '${pokemon.weight.toStringAsFixed(1)} kg',
                          Icons.fitness_center,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoCard(
                          'Altura',
                          '${pokemon.height.toStringAsFixed(1)} m',
                          Icons.height,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  // Category and Ability
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          'Categoría',
                          pokemon.category.isNotEmpty ? pokemon.category : 'Desconocida',
                          Icons.category,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoCard(
                          'Habilidad',
                          pokemon.abilities.isNotEmpty 
                              ? pokemon.abilities.first 
                              : 'Desconocida',
                          Icons.stars,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  // Gender ratio
                  if (pokemon.maleRatio > 0 || pokemon.femaleRatio > 0) ...[
                    Text(
                      'GÉNERO',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: pokemon.maleRatio.round(),
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: pokemon.femaleRatio.round(),
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.male, color: Colors.blue, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '${pokemon.maleRatio.toStringAsFixed(1)}%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.female, color: Colors.pink, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '${pokemon.femaleRatio.toStringAsFixed(1)}%',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                  ],
                  
                  // Weaknesses
                  if (pokemon.weaknesses.isNotEmpty) ...[
                    Text(
                      'Debilidades',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon.weaknesses.map((weakness) {
                        return Image.asset(
                          'assets/images/types/Type=$weakness.png',
                          height: 32,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: _getTypeColor(weakness),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                weakness,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _getTypeColor(pokemon.types.first),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.catching_pokemon), label: 'Pokédex'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Regiones'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}