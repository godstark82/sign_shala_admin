import 'package:admin_sign_shala/features/home/data/repositories/home_repo_impl.dart';
import 'package:admin_sign_shala/features/home/domain/repositories/home_repo.dart';
import 'package:admin_sign_shala/features/home/domain/usecases/total_courses_usecase.dart';
import 'package:admin_sign_shala/features/home/domain/usecases/total_student_usecase.dart';
import 'package:admin_sign_shala/features/home/presentation/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  //! Services
  sl.registerSingleton<Dio>(Dio());

  //! Repositories
  sl.registerSingleton<HomeRepository>(HomeRepoImpl());

  //! UseCases
  sl.registerSingleton<TotalCoursesUsecase>(TotalCoursesUsecase(sl()));
  sl.registerSingleton<TotalStudentUsecase>(TotalStudentUsecase(sl()));

  //! Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl()));
}
