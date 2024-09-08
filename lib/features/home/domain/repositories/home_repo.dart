import 'package:admin_sign_shala/core/datastate/datastate.dart';

abstract class HomeRepository {
  //! Fun to get Total Students From the Database
  Future<DataState<int>> getTotalStudentsCount();

  //! Fun to get Total Courses From the Database
  Future<DataState<int>> getTotalCoursesCount();
}
