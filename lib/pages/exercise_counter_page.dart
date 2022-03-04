import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_app/models/exercise.dart';
import 'package:workout_app/streams/stop_watch_stream.dart';

class ExerciseCounterPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseCounterPage({Key? key, required this.exercise})
      : super(key: key);

  @override
  _ExerciseCounterPageState createState() => _ExerciseCounterPageState();
}

class _ExerciseCounterPageState extends State<ExerciseCounterPage> {
  // initialize StopWatch data
  Stream<int>? timerStream = stopWatchStream();
  StreamSubscription<int>? timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';
  String buttonText = 'START REST';
  // Saves rest times to a list
  List<String> restTimes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$hoursStr:$minutesStr:$secondsStr",
            style: const TextStyle(
              fontSize: 84.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (timerStream == null && timerSubscription == null) {
                    setState(() {
                      buttonText = 'STOP REST';
                    });
                    startTheWatch();
                  } else {
                    setState(() {
                      buttonText = 'START REST';
                    });
                    stopTheWatch();
                  }
                },
                child: Text(buttonText),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restTimes.length,
              itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.lock_clock),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          restTimes.removeAt(index);
                        });
                      } ,
                      icon: const Icon(Icons.remove_circle_outline)),
                  title: Text(restTimes[index])),
            ),
          )
        ],
      ),
    );
  }

  void startTheWatch() {
    timerStream = stopWatchStream();
    timerSubscription = timerStream!.listen((int newTick) {
      setState(() {
        hoursStr =
            ((newTick / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
        minutesStr = ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
        secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');
      });
    });
  }

  void stopTheWatch() {
    if (timerSubscription != null) {
      timerSubscription!.cancel();
    }
    timerStream = null;
    timerSubscription = null;
    // pushes current time to restTimes list
    restTimes.add('$hoursStr:$minutesStr:$secondsStr');
    setState(() {
      hoursStr = '00';
      minutesStr = '00';
      secondsStr = '00';
    });
  }
}
