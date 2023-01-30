class Activity {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final int attendeesCount;

  const Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.attendeesCount,
  });
}
