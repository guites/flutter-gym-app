import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/api/languages.dart';
import 'package:workout_app/controller/gym_tab_controller.dart';
import 'package:workout_app/controller/language_controller.dart';
import 'package:workout_app/models/language.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    return Consumer<LanguageController>(
      builder: (context, languageController, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'The gym',
                style: Theme.of(context).textTheme.headline3,
              ),
              const Divider(),
              const Text(
                'Choose a language',
              ),
              FutureBuilder(
                future: languages(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return DropdownButton(
                      value: languageController.currentLanguage,
                      onChanged: (int? newValue) {
                        setState(() {
                          languageController.setLanguage(newValue!);
                        });
                      },
                      items: createDropdownItems(snapshot),
                    );
                  }
                  return const Text('Ocorreu um erro!');
                },
              ),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/exercises');
              }, child: const Text('Go to Exercises Page'))
            ],
          ),
        ),
      ),
    );
  }
}
