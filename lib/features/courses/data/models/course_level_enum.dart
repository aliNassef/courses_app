enum CourseLevel { all, beginner, intermediate, advanced, expert }

extension CourseLevelExtension on CourseLevel {
  String get name {
    switch (this) {
      case CourseLevel.all:
        return 'All';
      case CourseLevel.beginner:
        return 'Beginner';
      case CourseLevel.intermediate:
        return 'Intermediate';
      case CourseLevel.advanced:
        return 'Advanced';
      case CourseLevel.expert:
        return 'Expert';
    }
  }
}
