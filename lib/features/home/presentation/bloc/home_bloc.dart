import 'package:admin_sign_shala/core/datastate/datastate.dart';
import 'package:admin_sign_shala/features/home/domain/usecases/total_courses_usecase.dart';
import 'package:admin_sign_shala/features/home/domain/usecases/total_student_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TotalCoursesUsecase coursesUsecase;
  final TotalStudentUsecase studentUsecase;
  HomeBloc(
    this.coursesUsecase,
    this.studentUsecase,
  ) : super(HomeLoadingState()) {
    on<HomeLoadEvent>(_loadHomeData);
  }
  void _loadHomeData(HomeLoadEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final totalCourses = await coursesUsecase.call({});
    final totalStudents = await studentUsecase.call({});

    if (totalStudents is DataSuccess && totalCourses is DataSuccess) {
      emit(HomeLoadedState(
          totalCourses: totalCourses.data, totalStudents: totalStudents.data));
    } else {
      emit(HomeErrorState('Something went wrong'));
    }
  }
}
