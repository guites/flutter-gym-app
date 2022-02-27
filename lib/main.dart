import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/controller/language_controller.dart';
import 'package:workout_app/pages/exercises_page.dart';
import 'package:workout_app/pages/gym_tab_page.dart';
import 'package:workout_app/pages/home_page.dart';
import 'package:workout_app/controller/gym_tab_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GymTabController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageController(),
        )
      ],
      child: MaterialApp(
        title: 'Workout app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(title: 'Home'),
          '/exercises': (context) => const ExercisesPage(title: 'Exercises'),
          '/gym-tab': (context) => const GymTabPage(title: 'Gym Tab'),
        },
      ),
    );
  }
}
