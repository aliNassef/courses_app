import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'course_level_enum.dart';

class CourseModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final num price;
  final int duration;
  final double rating;
  final int subscribersCount;
  final List<String> objectives;
  final String introVideoUrl;
  final String categoryId;
  final String instructorId;
  final String imageUrl;
  final DateTime createdAt;
  final bool bestSeller;
  final int numOfRating;
  final CourseLevel level;

  const CourseModel({
    required this.level,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.duration,
    required this.rating,
    required this.subscribersCount,
    required this.objectives,
    required this.introVideoUrl,
    required this.categoryId,
    required this.instructorId,
    required this.createdAt,
    required this.bestSeller,
    required this.imageUrl,
    required this.numOfRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'level': level.name,
      'description': description,
      'price': price,
      'duration': duration,
      'rating': rating,
      'subscribersCount': subscribersCount,
      'objectives': objectives,
      'introVideoUrl': introVideoUrl,
      'categoryId': categoryId,
      'instructorId': instructorId,
      'createdAt': createdAt,
      'bestSeller': bestSeller,
      'imageUrl': imageUrl,
      'numOfRating': numOfRating,
    };
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      level: CourseLevel.values.firstWhere((e) => e.name == json['level']),
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      duration: json['duration'],
      rating: json['rating'],
      subscribersCount: json['subscribersCount'],
      objectives: (json['objectives'] as List<dynamic>).cast<String>(),
      introVideoUrl: json['introVideoUrl'],
      categoryId: json['categoryId'],
      instructorId: json['instructorId'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      bestSeller: json['bestSeller'],
      numOfRating: json['numOfRating'],
    );
  }
  static List<CourseModel> dummyData = [
    CourseModel(
      numOfRating: 0,
      level: CourseLevel.beginner,
      id: FirebaseFirestore.instance.collection('courses').doc().id,
      title: 'Flutter From Zero to Hero',
      description: 'تعلم Flutter من البداية للاحتراف',
      price: 499,
      duration: 1200,
      rating: 0.0,
      subscribersCount: 0,
      objectives: ['فهم Flutter', 'بناء UI احترافي', 'التعامل مع Firebase'],
      introVideoUrl: 'https://video-url.com/intro.mp4',
      categoryId: 'mobile-dev',
      instructorId: '',
      createdAt: DateTime.now(),
      imageUrl:
          "https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",
      bestSeller: false,
    ),
    CourseModel(
      numOfRating: 0,
      level: CourseLevel.beginner,

      imageUrl:
          "https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",

      id: FirebaseFirestore.instance.collection('courses').doc().id,
      title: 'Flutter From Zero to Hero',
      description: 'تعلم Flutter من البداية للاحتراف',
      price: 499,
      duration: 1200,
      rating: 0.0,
      subscribersCount: 0,
      objectives: ['فهم Flutter', 'بناء UI احترافي', 'التعامل مع Firebase'],
      introVideoUrl: 'https://video-url.com/intro.mp4',
      categoryId: 'mobile-dev',
      instructorId: '',
      createdAt: DateTime.now(),
      bestSeller: false,
    ),
    CourseModel(
      numOfRating: 0,
      level: CourseLevel.beginner,

      id: FirebaseFirestore.instance.collection('courses').doc().id,
      title: 'Flutter From Zero to Hero',
      description: 'تعلم Flutter من البداية للاحتراف',
      price: 499,
      duration: 1200,
      rating: 0.0,
      subscribersCount: 0,
      objectives: ['فهم Flutter', 'بناء UI احترافي', 'التعامل مع Firebase'],
      introVideoUrl: 'https://video-url.com/intro.mp4',
      categoryId: 'mobile-dev',
      instructorId: '',
      imageUrl:
          "https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",

      createdAt: DateTime.now(),
      bestSeller: false,
    ),
    CourseModel(
      numOfRating: 0,
      level: CourseLevel.beginner,

      id: FirebaseFirestore.instance.collection('courses').doc().id,
      title: 'Flutter From Zero to Hero',
      imageUrl:
          "https://tse3.mm.bing.net/th/id/OIP.Wwk-gQuVkQHi8a5qiNXY9AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",

      description: 'تعلم Flutter من البداية للاحتراف',
      price: 499,
      duration: 1200,
      rating: 0.0,
      subscribersCount: 0,
      objectives: ['فهم Flutter', 'بناء UI احترافي', 'التعامل مع Firebase'],
      introVideoUrl: 'https://video-url.com/intro.mp4',
      categoryId: 'mobile-dev',
      instructorId: '',
      createdAt: DateTime.now(),
      bestSeller: false,
    ),
  ];

  @override
  List<Object?> get props => [id];
}
