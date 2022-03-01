import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/api/exercises.dart';
import 'package:workout_app/components/fading_scroller.dart';
import 'package:workout_app/controller/gym_tab_controller.dart';
import 'package:workout_app/controller/language_controller.dart';
import 'package:workout_app/models/exercise.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  List<Exercise>? allExercises;
  String _searchText = '';

  Future<List<Exercise>> grabExercises(int languageId, String searchText) async {
    late List<Exercise> _allExercises;
    if (allExercises != null && allExercises!.isNotEmpty) {
      if (searchText.isNotEmpty && searchText.length > 2) {
        _allExercises = allExercises!
            .where((e) => e.name.toLowerCase().contains(searchText.toLowerCase()))
            .cast<Exercise>()
            .toList();
      } else {
        _allExercises = allExercises!;
      }
    } else {
      _allExercises = await exercises(languageId);
      setState(() {
        allExercises = _allExercises;
      });
    }
    return _allExercises;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int appCurrentLanguage = context.select<LanguageController, int>(
      // Here, we are only interested on what the [currentLanguage] is at the present moment.
      (languageController) => languageController.currentLanguage,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/gym-tab'),
            icon: const Icon(Icons.list_alt_rounded),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search for an exercise',
            ),
            onChanged: (newStr) {
              setState(() {
                _searchText = newStr;
              });
            },
          ),
          FutureBuilder(
            future: grabExercises(appCurrentLanguage, _searchText),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: FadingScroller(
                    builder: (context, scrollController) => ListView.builder(
                      controller: scrollController,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data[index].name),
                            trailing: _AddButton(exercise: snapshot.data[index]),
                          );
                        }),
                  ),
                );
              }
              return const Text('Ocorreu um erro!');
            },
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Exercise exercise;

  const _AddButton({required this.exercise, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    final bool isInGymTab = context.select<GymTabController, bool>(
      // Here, we are only interested whether [exercise] is inside the gym tab.
      (gymTab) => gymTab.exercises.contains(exercise),
    );

    return TextButton(
      onPressed: isInGymTab
          ? null
          : () {
              // If the item is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var gymTab = context.read<GymTabController>();
              gymTab.add(exercise);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInGymTab
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}
