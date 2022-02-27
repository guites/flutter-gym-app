import 'package:workout_app/api/database.dart';
import 'package:workout_app/models/language.dart';

Future<List<Language>> languages() async {
  final db = await DB.instance.database;

  final List<Map<String, dynamic>> maps = await db.query('core_language');

  final List<Language> languages = List.generate(maps.length, (index) {
    return Language(
      (b) => b
        ..id = maps[index]['id']
        ..short_name = maps[index]['short_name']
        ..full_name = maps[index]['full_name'],
    );
  });

  return languages;
}
