class Task {
  Task(
      {required this.type,
      required this.title,
      required this.description,
      required this.isCompleted});
  final String type;
  final String title;
  final String description;
  bool isCompleted;
}
