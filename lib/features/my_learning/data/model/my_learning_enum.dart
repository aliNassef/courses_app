enum MyLearningEnum {
  ongoing,
  completed
  ;

  String get value {
    switch (this) {
      case MyLearningEnum.ongoing:
        return 'Ongoing';
      case MyLearningEnum.completed:
        return 'Completed';
    }
  }
}
