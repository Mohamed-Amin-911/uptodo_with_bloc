// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uptodo_with_bloc/data/task_class.dart';

// const key = 'todo_list';

// class SharedPrefs {


//   getSharedPrefrences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     readFromSp();
//   }

//   saveIntoSp(Task task) async {
//     tasks.add(task);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> taskListString =
//         tasks.map((contact) => jsonEncode(contact.toJson())).toList();
//     prefs.setStringList('myData', taskListString);
//   }

//   Future<List<Task>> readFromSp() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     List<String>? contactListString = prefs.getStringList('myData');
//     if (contactListString != null) {
//      List<Task> taskss = contactListString
//           .map((contact) => Task.fromJson(json.decode(contact)))
//           .toList();

//           return taskss;
//       } 

//       else{
//         return [];
//       }
    
//   }
// }
