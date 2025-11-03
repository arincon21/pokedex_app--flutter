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
  final ScrollController _scrollController = ScrollController();

  final List<Pokemon> _pokemons = [];
  bool _isLoading = false;
  bool _hasReachedEnd = false;
  String? _error;
  int _currentPage = 1;
  static const int _pageSize = 20;

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
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredPokemons.length + (_isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == filteredPokemons.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadNextPage();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadNextPage();
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoading || _hasReachedEnd) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repository = ref.read(pokemonRepositoryProvider);
      final newPokemons = await repository.getPokemons(
        offset: (_currentPage - 1) * _pageSize,
        limit: _pageSize,
      );

      if (newPokemons.isEmpty) {
        setState(() {
          _hasReachedEnd = true;
          _isLoading = false;
        });
        return;
      }

      setState(() {
        _currentPage++;
        _pokemons.addAll(newPokemons);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _retry() {
    setState(() {
      _error = null;
      _hasReachedEnd = false;
      _currentPage = 1;
      _pokemons.clear();
    });
    _loadNextPage();
  }
}