import 'dart:convert';

List<Task> taskFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  final String txt;
  final String date;

  Task({
    required this.txt,
    required this.date,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        txt: json["txt"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "txt": txt,
        "date": date,
      };
}
