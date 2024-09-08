part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeLoadedState extends HomeState {
  final int? totalStudents;
  final int? totalCourses;
  const HomeLoadedState(
      {required this.totalCourses, required this.totalStudents});
}

class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState(this.error);
}
