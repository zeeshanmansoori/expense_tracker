part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int currentPageIndex;

  @override
  List<Object?> get props => [currentPageIndex];

  const BottomNavigationState({
    this.currentPageIndex = 0,
  });

  BottomNavigationState copyWith({
    int? currentPageIndex,
  }) {
    return BottomNavigationState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
