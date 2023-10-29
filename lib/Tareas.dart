class Tareas {
  int? id;
  String title;
  bool isCompleted;

  Tareas({this.id, required this.title, this.isCompleted = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Tareas.fromMap(Map<String, dynamic> map) {
    return Tareas(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
