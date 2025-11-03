class ApiConstants {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const String pokemonEndpoint = '$baseUrl/pokemon';
  static const String speciesEndpoint = '$baseUrl/pokemon-species';
  
  static String getPokemonDetailsEndpoint(String name) => '$pokemonEndpoint/$name';
  static String getPokemonSpeciesEndpoint(String idOrName) => '$speciesEndpoint/$idOrName';
}