import 'package:equatable/equatable.dart';

class InstructorModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String position;
  final String image;
  final Map<String, dynamic> coursesProvided;

  const InstructorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.position,
    required this.image,
    required this.coursesProvided,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'position': position,
      'image': image,
      'coursesProvided': coursesProvided,
    };
  }

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      position: map['position'] as String,
      image: map['image'] as String,
      coursesProvided: Map<String, dynamic>.from(
        (map['coursesProvided'] as Map<String, dynamic>),
      ),
    );
  }

  @override
  List<Object?> get props => [id];
}
