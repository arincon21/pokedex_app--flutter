// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pokemon {

 String get id; String get name; List<String> get types; String get imageUrl; bool get isFavorite; String get description; double get weight; double get height; List<String> get abilities; String get category; double get maleRatio; double get femaleRatio; List<String> get weaknesses; Map<String, int>? get stats;
/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonCopyWith<Pokemon> get copyWith => _$PokemonCopyWithImpl<Pokemon>(this as Pokemon, _$identity);

  /// Serializes this Pokemon to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pokemon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.description, description) || other.description == description)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.abilities, abilities)&&(identical(other.category, category) || other.category == category)&&(identical(other.maleRatio, maleRatio) || other.maleRatio == maleRatio)&&(identical(other.femaleRatio, femaleRatio) || other.femaleRatio == femaleRatio)&&const DeepCollectionEquality().equals(other.weaknesses, weaknesses)&&const DeepCollectionEquality().equals(other.stats, stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(types),imageUrl,isFavorite,description,weight,height,const DeepCollectionEquality().hash(abilities),category,maleRatio,femaleRatio,const DeepCollectionEquality().hash(weaknesses),const DeepCollectionEquality().hash(stats));

@override
String toString() {
  return 'Pokemon(id: $id, name: $name, types: $types, imageUrl: $imageUrl, isFavorite: $isFavorite, description: $description, weight: $weight, height: $height, abilities: $abilities, category: $category, maleRatio: $maleRatio, femaleRatio: $femaleRatio, weaknesses: $weaknesses, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $PokemonCopyWith<$Res>  {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) _then) = _$PokemonCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<String> types, String imageUrl, bool isFavorite, String description, double weight, double height, List<String> abilities, String category, double maleRatio, double femaleRatio, List<String> weaknesses, Map<String, int>? stats
});




}
/// @nodoc
class _$PokemonCopyWithImpl<$Res>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._self, this._then);

  final Pokemon _self;
  final $Res Function(Pokemon) _then;

/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? types = null,Object? imageUrl = null,Object? isFavorite = null,Object? description = null,Object? weight = null,Object? height = null,Object? abilities = null,Object? category = null,Object? maleRatio = null,Object? femaleRatio = null,Object? weaknesses = null,Object? stats = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,maleRatio: null == maleRatio ? _self.maleRatio : maleRatio // ignore: cast_nullable_to_non_nullable
as double,femaleRatio: null == femaleRatio ? _self.femaleRatio : femaleRatio // ignore: cast_nullable_to_non_nullable
as double,weaknesses: null == weaknesses ? _self.weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Pokemon].
extension PokemonPatterns on Pokemon {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pokemon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pokemon value)  $default,){
final _that = this;
switch (_that) {
case _Pokemon():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pokemon value)?  $default,){
final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<String> types,  String imageUrl,  bool isFavorite,  String description,  double weight,  double height,  List<String> abilities,  String category,  double maleRatio,  double femaleRatio,  List<String> weaknesses,  Map<String, int>? stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
return $default(_that.id,_that.name,_that.types,_that.imageUrl,_that.isFavorite,_that.description,_that.weight,_that.height,_that.abilities,_that.category,_that.maleRatio,_that.femaleRatio,_that.weaknesses,_that.stats);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<String> types,  String imageUrl,  bool isFavorite,  String description,  double weight,  double height,  List<String> abilities,  String category,  double maleRatio,  double femaleRatio,  List<String> weaknesses,  Map<String, int>? stats)  $default,) {final _that = this;
switch (_that) {
case _Pokemon():
return $default(_that.id,_that.name,_that.types,_that.imageUrl,_that.isFavorite,_that.description,_that.weight,_that.height,_that.abilities,_that.category,_that.maleRatio,_that.femaleRatio,_that.weaknesses,_that.stats);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<String> types,  String imageUrl,  bool isFavorite,  String description,  double weight,  double height,  List<String> abilities,  String category,  double maleRatio,  double femaleRatio,  List<String> weaknesses,  Map<String, int>? stats)?  $default,) {final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
return $default(_that.id,_that.name,_that.types,_that.imageUrl,_that.isFavorite,_that.description,_that.weight,_that.height,_that.abilities,_that.category,_that.maleRatio,_that.femaleRatio,_that.weaknesses,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pokemon implements Pokemon {
  const _Pokemon({required this.id, required this.name, required final  List<String> types, required this.imageUrl, this.isFavorite = false, this.description = '', this.weight = 0.0, this.height = 0.0, final  List<String> abilities = const [], this.category = '', this.maleRatio = 0.0, this.femaleRatio = 0.0, final  List<String> weaknesses = const [], final  Map<String, int>? stats}): _types = types,_abilities = abilities,_weaknesses = weaknesses,_stats = stats;
  factory _Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

@override final  String id;
@override final  String name;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override final  String imageUrl;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  String description;
@override@JsonKey() final  double weight;
@override@JsonKey() final  double height;
 final  List<String> _abilities;
@override@JsonKey() List<String> get abilities {
  if (_abilities is EqualUnmodifiableListView) return _abilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abilities);
}

@override@JsonKey() final  String category;
@override@JsonKey() final  double maleRatio;
@override@JsonKey() final  double femaleRatio;
 final  List<String> _weaknesses;
@override@JsonKey() List<String> get weaknesses {
  if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weaknesses);
}

 final  Map<String, int>? _stats;
@override Map<String, int>? get stats {
  final value = _stats;
  if (value == null) return null;
  if (_stats is EqualUnmodifiableMapView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonCopyWith<_Pokemon> get copyWith => __$PokemonCopyWithImpl<_Pokemon>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pokemon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.description, description) || other.description == description)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other._abilities, _abilities)&&(identical(other.category, category) || other.category == category)&&(identical(other.maleRatio, maleRatio) || other.maleRatio == maleRatio)&&(identical(other.femaleRatio, femaleRatio) || other.femaleRatio == femaleRatio)&&const DeepCollectionEquality().equals(other._weaknesses, _weaknesses)&&const DeepCollectionEquality().equals(other._stats, _stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_types),imageUrl,isFavorite,description,weight,height,const DeepCollectionEquality().hash(_abilities),category,maleRatio,femaleRatio,const DeepCollectionEquality().hash(_weaknesses),const DeepCollectionEquality().hash(_stats));

@override
String toString() {
  return 'Pokemon(id: $id, name: $name, types: $types, imageUrl: $imageUrl, isFavorite: $isFavorite, description: $description, weight: $weight, height: $height, abilities: $abilities, category: $category, maleRatio: $maleRatio, femaleRatio: $femaleRatio, weaknesses: $weaknesses, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$PokemonCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$PokemonCopyWith(_Pokemon value, $Res Function(_Pokemon) _then) = __$PokemonCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<String> types, String imageUrl, bool isFavorite, String description, double weight, double height, List<String> abilities, String category, double maleRatio, double femaleRatio, List<String> weaknesses, Map<String, int>? stats
});




}
/// @nodoc
class __$PokemonCopyWithImpl<$Res>
    implements _$PokemonCopyWith<$Res> {
  __$PokemonCopyWithImpl(this._self, this._then);

  final _Pokemon _self;
  final $Res Function(_Pokemon) _then;

/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? types = null,Object? imageUrl = null,Object? isFavorite = null,Object? description = null,Object? weight = null,Object? height = null,Object? abilities = null,Object? category = null,Object? maleRatio = null,Object? femaleRatio = null,Object? weaknesses = null,Object? stats = freezed,}) {
  return _then(_Pokemon(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,abilities: null == abilities ? _self._abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,maleRatio: null == maleRatio ? _self.maleRatio : maleRatio // ignore: cast_nullable_to_non_nullable
as double,femaleRatio: null == femaleRatio ? _self.femaleRatio : femaleRatio // ignore: cast_nullable_to_non_nullable
as double,weaknesses: null == weaknesses ? _self._weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as List<String>,stats: freezed == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}


}

// dart format on
