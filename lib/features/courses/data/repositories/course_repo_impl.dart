import 'package:admin_sign_shala/core/datastate/datastate.dart';
import 'package:admin_sign_shala/features/courses/data/models/course_model.dart';
import 'package:admin_sign_shala/features/courses/domain/repositories/course_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseRepoImpl implements CourseRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addNewCourse(CourseModel course) async {
    course.id = DateTime.now().toString();
    course.launchDate = DateTime.now();
    course.totalStudentsEnrolled = 0;
    await course.uploadCourseToFirestore();
  }

  @override
  Future<DataState<List<CourseModel>>> fetchCourses(CourseModel course) {
    // TODO: implement fetchCourses
    throw UnimplementedError();
  }

  @override
  Future<void> updateCourse(CourseModel course) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }
}
