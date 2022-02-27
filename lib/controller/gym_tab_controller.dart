import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:workout_app/models/exercise.dart';

class GymTabController extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Exercise> _exercises = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Exercise> get exercises => UnmodifiableListView(_exercises);

  /// The current total price of all items (assuming all items cost $42).
  int get exerciseCount => _exercises.length;

  /// Adds [exercise] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Exercise exercise) {
    _exercises.add(exercise);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(Exercise exercise) {
    _exercises.remove(exercise);
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _exercises.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}