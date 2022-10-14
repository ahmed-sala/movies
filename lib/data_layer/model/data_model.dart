class WatchAdd {
  static const String collecionName = 'watch';
  String? imageUel;
  String? title;
  String? time;
  String? id;
  String? average;

  WatchAdd({this.title, this.id, this.time, this.average, this.imageUel});

  WatchAdd.fromFirestore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            time: data['time'],
            imageUel: data['imageUrl'],
            average: data['average']);

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'imageUrl': imageUel,
      'average': average
    };
  }
}
