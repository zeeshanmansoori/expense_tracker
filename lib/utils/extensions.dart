extension ListExtension<T> on List<T> {
  List<E> mapWithIndexed<E>(E Function(int index, T value) converter) {
    return asMap()
        .map(
          (index, value) => MapEntry(index, converter.call(index, value)),
        )
        .values
        .toList();
  }
}
