enum MyLearningEnum {
  inProgress,
  completed
  ;

  String get value {
    switch (this) {
      case MyLearningEnum.inProgress:
        return 'In Progress';
      case MyLearningEnum.completed:
        return 'Completed';
    }
  }
}
