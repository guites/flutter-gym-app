// ignore_for_file: non_constant_identifier_names

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'language.g.dart';

abstract class Language implements Built<Language, LanguageBuilder> {
  int get id;
  String get short_name;
  String get full_name;

  Language._();
  factory Language([void Function(LanguageBuilder)? updates]) = _$Language;
  static Serializer<Language> get serializer => _$languageSerializer;
}
