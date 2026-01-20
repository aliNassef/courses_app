class LessonModel {
  final String id;
  final String name;
  final String videoUrl;
  final int duration;
  final int order;
  final bool isCompleted;
  final String description;

  LessonModel({
    required this.id,
    required this.name,
    required this.videoUrl,
    required this.duration,
    required this.order,
    required this.isCompleted,
    required this.description,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      name: json['name'],
      videoUrl: json['videoUrl'],
      duration: json['duration'],
      order: json['order'],
      isCompleted: json['isFree'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'videoUrl': videoUrl,
      'duration': duration,
      'order': order,
      'isFree': isCompleted,
      'description': description,
    };
  }
}
