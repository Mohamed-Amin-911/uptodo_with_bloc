import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo_with_bloc/data/task_class.dart';

class SharedPrefs {
// Function to save a list of objects to SharedPreferences
  Future<void> saveData(List<Task> objects) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> maps =
        objects.map((object) => object.toMap()).toList();
    final String jsonData = jsonEncode(maps);
    await prefs.setString('my_objects_key', jsonData);
  }

// Function to retrieve a list of objects from SharedPreferences
  Future<List<Task>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString('my_objects_key');

    // No data stored, return empty list
    if (jsonData == null) return [];

    final List<Map<String, dynamic>> maps =
        jsonDecode(jsonData) as List<Map<String, dynamic>>;
    final List<Task> objects =
        maps.map((map) => Task(date: map['date'], txt: map['text'])).toList();
    return objects;
  }
}
