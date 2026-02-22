import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pokemon_provider.dart';
import '../../domain/entities/pokemon.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import 'pokemon_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;
  String _searchQuery = '';

  final List<Pokemon> _pokemons = [];
  bool _isLoading = false;
  String? _error;
  static const int _maxPokemons = 1025; // Gen 1-9 approximately

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PokemonSearchBar(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              onSubmitted: () {
                final query = _searchController.text.toLowerCase();
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            // Progress indicator
            if (_pokemons.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_pokemons.length} / $_maxPokemons Pokémon cargados',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (_isLoading)
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  ],
                ),
              ),
            Expanded(
              child: Builder(
                builder: (context) {
                  final filteredPokemons = _pokemons.where((pokemon) =>
                    pokemon.name.toLowerCase().contains(_searchQuery) ||
                    pokemon.id.contains(_searchQuery)
                  ).toList();

                  if (_pokemons.isEmpty && _isLoading) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Cargando Pokémon...'),
                        ],
                      ),
                    );
                  }

                  if (_error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          Text('Error: $_error'),
                          TextButton(
                            onPressed: () {
                              _retry();
                            },
                            child: const Text('Intentar de nuevo'),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemons[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: PokemonCard(
                          number: pokemon.id,
                          name: pokemon.name,
                          types: pokemon.types,
                          imageUrl: pokemon.imageUrl,
                          isFavorite: pokemon.isFavorite,
                          onFavoritePressed: () {
                            // Implementar la lógica de favoritos
                          },
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PokemonDetailScreen(pokemon: pokemon),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    // Cargar los primeros 100 Pokémon
    await _loadChunk(offset: 0, limit: 100);
    
    // Cargar el resto en segundo plano
    _loadRemainingPokemons();
  }
  
  Future<void> _loadRemainingPokemons() async {
    await _loadChunk(offset: 100, limit: 925);
  }

  void _addPokemons(List<Pokemon> newPokemons) {
    setState(() {
      _pokemons.addAll(newPokemons);
      _pokemons.sort((a, b) => a.id.compareTo(b.id));
    });
  }

  Future<void> _loadChunk({required int offset, required int limit}) async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    Future.microtask(() async {
      try {
        final repository = ref.read(pokemonRepositoryProvider);
        final newPokemons = await repository.getPokemons(
          offset: offset,
          limit: limit,
        );
        _addPokemons(newPokemons);
      } catch (e) {
        if (mounted) {
          setState(() {
            _error = e.toString();
          });
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    });
  }

  void _retry() {
    setState(() {
      _error = null;
      _pokemons.clear();
    });
    _loadInitialData();
  }
}