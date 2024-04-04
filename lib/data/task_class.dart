class Task {
  final String txt;
  final String date;
  Task({required this.date, required this.txt});
  Map<String, dynamic> toMap() {
    return {
      'text': txt,
      'date': date,
    };
  }
}
