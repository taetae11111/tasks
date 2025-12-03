// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_do_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToDoDto {

 String get id; String get title; String? get description; bool get isFavorite; bool get isDone;@TimestampConverter() DateTime get createdAt;
/// Create a copy of ToDoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoDtoCopyWith<ToDoDto> get copyWith => _$ToDoDtoCopyWithImpl<ToDoDto>(this as ToDoDto, _$identity);

  /// Serializes this ToDoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isFavorite,isDone,createdAt);

@override
String toString() {
  return 'ToDoDto(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isDone: $isDone, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ToDoDtoCopyWith<$Res>  {
  factory $ToDoDtoCopyWith(ToDoDto value, $Res Function(ToDoDto) _then) = _$ToDoDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, bool isFavorite, bool isDone,@TimestampConverter() DateTime createdAt
});




}
/// @nodoc
class _$ToDoDtoCopyWithImpl<$Res>
    implements $ToDoDtoCopyWith<$Res> {
  _$ToDoDtoCopyWithImpl(this._self, this._then);

  final ToDoDto _self;
  final $Res Function(ToDoDto) _then;

/// Create a copy of ToDoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? isFavorite = null,Object? isDone = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ToDoDto].
extension ToDoDtoPatterns on ToDoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToDoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToDoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToDoDto value)  $default,){
final _that = this;
switch (_that) {
case _ToDoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToDoDto value)?  $default,){
final _that = this;
switch (_that) {
case _ToDoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  bool isFavorite,  bool isDone, @TimestampConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToDoDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  bool isFavorite,  bool isDone, @TimestampConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ToDoDto():
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  bool isFavorite,  bool isDone, @TimestampConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ToDoDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToDoDto implements ToDoDto {
  const _ToDoDto({required this.id, required this.title, this.description, this.isFavorite = false, this.isDone = false, @TimestampConverter() required this.createdAt});
  factory _ToDoDto.fromJson(Map<String, dynamic> json) => _$ToDoDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isDone;
@override@TimestampConverter() final  DateTime createdAt;

/// Create a copy of ToDoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoDtoCopyWith<_ToDoDto> get copyWith => __$ToDoDtoCopyWithImpl<_ToDoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToDoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isFavorite,isDone,createdAt);

@override
String toString() {
  return 'ToDoDto(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isDone: $isDone, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ToDoDtoCopyWith<$Res> implements $ToDoDtoCopyWith<$Res> {
  factory _$ToDoDtoCopyWith(_ToDoDto value, $Res Function(_ToDoDto) _then) = __$ToDoDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, bool isFavorite, bool isDone,@TimestampConverter() DateTime createdAt
});




}
/// @nodoc
class __$ToDoDtoCopyWithImpl<$Res>
    implements _$ToDoDtoCopyWith<$Res> {
  __$ToDoDtoCopyWithImpl(this._self, this._then);

  final _ToDoDto _self;
  final $Res Function(_ToDoDto) _then;

/// Create a copy of ToDoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? isFavorite = null,Object? isDone = null,Object? createdAt = null,}) {
  return _then(_ToDoDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
