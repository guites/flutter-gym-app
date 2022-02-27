// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'exercise.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Exercise> _$exerciseSerializer = new _$ExerciseSerializer();

class _$ExerciseSerializer implements StructuredSerializer<Exercise> {
  @override
  final Iterable<Type> types = const [Exercise, _$Exercise];
  @override
  final String wireName = 'Exercise';

  @override
  Iterable<Object?> serialize(Serializers serializers, Exercise object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'license_author',
      serializers.serialize(object.license_author,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'creation_date',
      serializers.serialize(object.creation_date,
          specifiedType: const FullType(String)),
      'language_id',
      serializers.serialize(object.language_id,
          specifiedType: const FullType(int)),
      'license_id',
      serializers.serialize(object.license_id,
          specifiedType: const FullType(int)),
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'name_original',
      serializers.serialize(object.name_original,
          specifiedType: const FullType(String)),
      'exercise_base_id',
      serializers.serialize(object.exercise_base_id,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Exercise deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExerciseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'license_author':
          result.license_author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creation_date':
          result.creation_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'language_id':
          result.language_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'license_id':
          result.license_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name_original':
          result.name_original = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'exercise_base_id':
          result.exercise_base_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Exercise extends Exercise {
  @override
  final int id;
  @override
  final String license_author;
  @override
  final String status;
  @override
  final String description;
  @override
  final String name;
  @override
  final String creation_date;
  @override
  final int language_id;
  @override
  final int license_id;
  @override
  final String uuid;
  @override
  final String name_original;
  @override
  final int exercise_base_id;

  factory _$Exercise([void Function(ExerciseBuilder)? updates]) =>
      (new ExerciseBuilder()..update(updates)).build();

  _$Exercise._(
      {required this.id,
      required this.license_author,
      required this.status,
      required this.description,
      required this.name,
      required this.creation_date,
      required this.language_id,
      required this.license_id,
      required this.uuid,
      required this.name_original,
      required this.exercise_base_id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Exercise', 'id');
    BuiltValueNullFieldError.checkNotNull(
        license_author, 'Exercise', 'license_author');
    BuiltValueNullFieldError.checkNotNull(status, 'Exercise', 'status');
    BuiltValueNullFieldError.checkNotNull(
        description, 'Exercise', 'description');
    BuiltValueNullFieldError.checkNotNull(name, 'Exercise', 'name');
    BuiltValueNullFieldError.checkNotNull(
        creation_date, 'Exercise', 'creation_date');
    BuiltValueNullFieldError.checkNotNull(
        language_id, 'Exercise', 'language_id');
    BuiltValueNullFieldError.checkNotNull(license_id, 'Exercise', 'license_id');
    BuiltValueNullFieldError.checkNotNull(uuid, 'Exercise', 'uuid');
    BuiltValueNullFieldError.checkNotNull(
        name_original, 'Exercise', 'name_original');
    BuiltValueNullFieldError.checkNotNull(
        exercise_base_id, 'Exercise', 'exercise_base_id');
  }

  @override
  Exercise rebuild(void Function(ExerciseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExerciseBuilder toBuilder() => new ExerciseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Exercise &&
        id == other.id &&
        license_author == other.license_author &&
        status == other.status &&
        description == other.description &&
        name == other.name &&
        creation_date == other.creation_date &&
        language_id == other.language_id &&
        license_id == other.license_id &&
        uuid == other.uuid &&
        name_original == other.name_original &&
        exercise_base_id == other.exercise_base_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, id.hashCode),
                                            license_author.hashCode),
                                        status.hashCode),
                                    description.hashCode),
                                name.hashCode),
                            creation_date.hashCode),
                        language_id.hashCode),
                    license_id.hashCode),
                uuid.hashCode),
            name_original.hashCode),
        exercise_base_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Exercise')
          ..add('id', id)
          ..add('license_author', license_author)
          ..add('status', status)
          ..add('description', description)
          ..add('name', name)
          ..add('creation_date', creation_date)
          ..add('language_id', language_id)
          ..add('license_id', license_id)
          ..add('uuid', uuid)
          ..add('name_original', name_original)
          ..add('exercise_base_id', exercise_base_id))
        .toString();
  }
}

class ExerciseBuilder implements Builder<Exercise, ExerciseBuilder> {
  _$Exercise? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _license_author;
  String? get license_author => _$this._license_author;
  set license_author(String? license_author) =>
      _$this._license_author = license_author;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _creation_date;
  String? get creation_date => _$this._creation_date;
  set creation_date(String? creation_date) =>
      _$this._creation_date = creation_date;

  int? _language_id;
  int? get language_id => _$this._language_id;
  set language_id(int? language_id) => _$this._language_id = language_id;

  int? _license_id;
  int? get license_id => _$this._license_id;
  set license_id(int? license_id) => _$this._license_id = license_id;

  String? _uuid;
  String? get uuid => _$this._uuid;
  set uuid(String? uuid) => _$this._uuid = uuid;

  String? _name_original;
  String? get name_original => _$this._name_original;
  set name_original(String? name_original) =>
      _$this._name_original = name_original;

  int? _exercise_base_id;
  int? get exercise_base_id => _$this._exercise_base_id;
  set exercise_base_id(int? exercise_base_id) =>
      _$this._exercise_base_id = exercise_base_id;

  ExerciseBuilder();

  ExerciseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _license_author = $v.license_author;
      _status = $v.status;
      _description = $v.description;
      _name = $v.name;
      _creation_date = $v.creation_date;
      _language_id = $v.language_id;
      _license_id = $v.license_id;
      _uuid = $v.uuid;
      _name_original = $v.name_original;
      _exercise_base_id = $v.exercise_base_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Exercise other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Exercise;
  }

  @override
  void update(void Function(ExerciseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Exercise build() {
    final _$result = _$v ??
        new _$Exercise._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Exercise', 'id'),
            license_author: BuiltValueNullFieldError.checkNotNull(
                license_author, 'Exercise', 'license_author'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, 'Exercise', 'status'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Exercise', 'description'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Exercise', 'name'),
            creation_date: BuiltValueNullFieldError.checkNotNull(
                creation_date, 'Exercise', 'creation_date'),
            language_id: BuiltValueNullFieldError.checkNotNull(
                language_id, 'Exercise', 'language_id'),
            license_id: BuiltValueNullFieldError.checkNotNull(
                license_id, 'Exercise', 'license_id'),
            uuid:
                BuiltValueNullFieldError.checkNotNull(uuid, 'Exercise', 'uuid'),
            name_original: BuiltValueNullFieldError.checkNotNull(
                name_original, 'Exercise', 'name_original'),
            exercise_base_id: BuiltValueNullFieldError.checkNotNull(
                exercise_base_id, 'Exercise', 'exercise_base_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
