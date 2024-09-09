import 'package:admin_sign_shala/core/datastate/datastate.dart';
import 'package:admin_sign_shala/features/courses/data/models/course_model.dart';

abstract class CourseRepo {
  Future<DataState<List<CourseModel>>> fetchCourses(CourseModel course);

  Future<void> updateCourse(CourseModel course);

  Future<void> addNewCourse(CourseModel course);
}
