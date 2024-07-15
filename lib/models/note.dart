class Note {
  int id;
  String title;
  String description;
  String date;

  Note({
    this.id,
    this.title,
    this.description,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}
