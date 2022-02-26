import 'package:flutter_test/flutter_test.dart';
import 'package:workout_app/models/tab_model.dart';
import 'package:workout_app/models/exercise.dart';

void main() {
  test('adding item increases total cost', () {
    final tab = TabModel();
    final exercisesCount = tab.exerciseCount;
    expect(exercisesCount, 0);
    tab.addListener(() {
      expect(tab.exerciseCount, greaterThan(exercisesCount));
    });
    tab.add(
        Exercise((b) => b
          ..id = 74
          ..license_author = 'wger.de'
          ..status = '2'
          ..description = '''
          <p>Hold the Barbell shoulder-wide, the back is straight, the shoulders slightly back, the arms are stretched. Bend the arms, bringing the weight up, with a fast movement. Without pausing, let down the bar with a slow and controlled movement.</p>
          <p>Don't allow your body to swing during the exercise, all work is done by the biceps, which are the only muscles that should move (pay attention to the elbows).</p>
          '''
          ..name = 'Biceps Curls With Barbell'
          ..creation_date = '2013-05-05'
          ..language_id = 2
          ..license_id = 1
          ..uuid = 'c56078d2ae854524a467d1e143b6df1a'
          ..name_original = 'Biceps curls with barbell'
          ..exercise_base_id = 91,
        ),
    );
  });
}