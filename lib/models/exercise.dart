// ignore_for_file: non_constant_identifier_names

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'exercise.g.dart';

abstract class Exercise implements Built<Exercise, ExerciseBuilder> {
  int get id;
  String get license_author;
  String get status;
  String get description;
  String get name;
  String get creation_date;
  int get language_id;
  int get license_id;
  String get uuid;
  String get name_original;
  int get exercise_base_id;

  Exercise._();
  factory Exercise([void Function(ExerciseBuilder)? updates]) = _$Exercise;
  static Serializer<Exercise> get serializer => _$exerciseSerializer;
}
