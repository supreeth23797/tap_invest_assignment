// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheme_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SchemeDetails {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchemeDetailsCopyWith<SchemeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemeDetailsCopyWith<$Res> {
  factory $SchemeDetailsCopyWith(
          SchemeDetails value, $Res Function(SchemeDetails) then) =
      _$SchemeDetailsCopyWithImpl<$Res, SchemeDetails>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$SchemeDetailsCopyWithImpl<$Res, $Val extends SchemeDetails>
    implements $SchemeDetailsCopyWith<$Res> {
  _$SchemeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchemeDetailsCopyWith<$Res>
    implements $SchemeDetailsCopyWith<$Res> {
  factory _$$_SchemeDetailsCopyWith(
          _$_SchemeDetails value, $Res Function(_$_SchemeDetails) then) =
      __$$_SchemeDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_SchemeDetailsCopyWithImpl<$Res>
    extends _$SchemeDetailsCopyWithImpl<$Res, _$_SchemeDetails>
    implements _$$_SchemeDetailsCopyWith<$Res> {
  __$$_SchemeDetailsCopyWithImpl(
      _$_SchemeDetails _value, $Res Function(_$_SchemeDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_SchemeDetails(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SchemeDetails implements _SchemeDetails {
  const _$_SchemeDetails({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'SchemeDetails(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchemeDetails &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchemeDetailsCopyWith<_$_SchemeDetails> get copyWith =>
      __$$_SchemeDetailsCopyWithImpl<_$_SchemeDetails>(this, _$identity);
}

abstract class _SchemeDetails implements SchemeDetails {
  const factory _SchemeDetails({required final String name}) = _$_SchemeDetails;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SchemeDetailsCopyWith<_$_SchemeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
