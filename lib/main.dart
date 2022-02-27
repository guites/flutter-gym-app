import 'package:flutter/material.dart';

import 'package:workout_app/api/exercises.dart';
import 'package:workout_app/api/languages.dart';
import 'package:workout_app/models/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Workout app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedLanguage = 2;

  List<DropdownMenuItem<int>> createDropdownItems(snapshot) {
    List<DropdownMenuItem<int>> items = [];
    snapshot.data.forEach((Language item) {
      items.add(DropdownMenuItem<int>(
        child: Text(item.full_name),
        value: item.id,
      ));
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is the workout app',
            ),
            FutureBuilder(
              future: languages(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return DropdownButton(
                    value: _selectedLanguage,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                    items: createDropdownItems(snapshot),
                  );
                }
                return const Text('Ocorreu um erro!');
              },
            ),
            FutureBuilder(
              future: exercises(_selectedLanguage),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data[index].name),
                          );
                        }),
                  );
                }
                return const Text('Ocorreu um erro!');
              },
            )
          ],
        ),
      ),
    );
  }
}
