import 'package:admin_sign_shala/features/courses/domain/entities/subject_entity.dart';

abstract class CourseEntity {
  int? id;
  String? title;
  String? shortDesc;
  String? longDesc;
  String? img;
  int? totalStudentsEnrolled;
  DateTime? launchDate;
  List<String>? professors;
  List<String>? categories;
  List<SubjectEntity>? subjects;

  CourseEntity({
     this.id,
     this.subjects,
     this.categories,
     this.img,
     this.launchDate,
     this.longDesc,
     this.professors,
     this.shortDesc,
     this.title,
     this.totalStudentsEnrolled,
  });
}
