extension ListExtension<T> on List<T> {
  T? firstWhereNext(
    bool Function(T element) test,
  ) {
    for (int i = 0; i < length - 1; i++) {
      if (test(this[i])) {
        return this[i + 1];
      }
    }
    return null;
  }
}
