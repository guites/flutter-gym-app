import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/controller/gym_tab_controller.dart';
import 'package:workout_app/pages/exercise_counter_page.dart';

class GymTabPage extends StatefulWidget {
  final String title;

  const GymTabPage({Key? key, required this.title}) : super(key: key);

  @override
  _GymTabPageState createState() => _GymTabPageState();
}

class _GymTabPageState extends State<GymTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(32),
            child: _TabList(),
          ))
        ],
      ),
    );
  }
}

class _TabList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This gets the current state of GymTabController and also tells Flutter
    // to rebuild this widget when GymTabController notifies listeners (in other words,
    // when it changes).
    final GymTabController gymTab = context.watch<GymTabController>();

    return gymTab.exerciseCount > 0
        ? ListView.builder(
            itemCount: gymTab.exerciseCount,
            itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.done),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => gymTab.remove(gymTab.exercises[index]),
                ),
                title: TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseCounterPage(
                              exercise: gymTab.exercises[index]))),
                  child: Text(gymTab.exercises[index].name),
                )))
        : const Center(child: Text('You haven\'t picked any exercises yet!'));
  }
}
