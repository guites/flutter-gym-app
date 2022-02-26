import 'package:workout_app/api/database.dart';
import 'package:workout_app/models/exercise.dart';

Future<List<Exercise>> exercises(int languageId) async {
  final db = await DB.instance.database;

  final List<Map<String, dynamic>> maps = await db.query('exercises_exercise', where: 'language_id = $languageId');

  final List<Exercise> exercises = List.generate(maps.length, (index) {
    return Exercise((b) => b
      ..id = maps[index]['id']
      ..license_author = maps[index]['license_author']
      ..status = maps[index]['status']
      ..description = maps[index]['description']
      ..name = maps[index]['name']
      ..creation_date = maps[index]['creation_date']
      ..language_id = maps[index]['language_id']
      ..license_id = maps[index]['license_id']
      ..uuid = maps[index]['uuid']
      ..name_original = maps[index]['name_original']
      ..exercise_base_id = maps[index]['exercise_base_id']);
  });

  return exercises;
}
