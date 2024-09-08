import 'package:admin_sign_shala/features/courses/domain/entities/course_entity.dart';
import 'subject_model.dart';

class CourseModel extends CourseEntity {
  CourseModel({
    int? id,
    List<SubjectModel>? subjects,
    List<String>? categories, 
    String? img, //*
    DateTime? launchDate, //!
    String? longDesc, //*
    List<String>? professors,
    String? shortDesc, //*
    String? title, //*
    int? totalStudentsEnrolled, //!
  }) : super(
          id: id,
          subjects: subjects,
          categories: categories,
          img: img,
          launchDate: launchDate,
          longDesc: longDesc,
          professors: professors,
          shortDesc: shortDesc,
          title: title,
          totalStudentsEnrolled: totalStudentsEnrolled,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      shortDesc: json['shortDesc'],
      longDesc: json['longDesc'],
      img: json['img'],
      totalStudentsEnrolled: json['totalStudentsEnrolled'],
      launchDate: DateTime.parse(json['launchDate']),
      professors: List<String>.from(json['professors']),
      categories: List<String>.from(json['categories']),
      subjects: (json['subjects'] as List)
          .map((subject) => SubjectModel.fromJson(subject))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'shortDesc': shortDesc,
      'longDesc': longDesc,
      'img': img,
      'totalStudentsEnrolled': totalStudentsEnrolled,
      'launchDate': launchDate?.toIso8601String(),
      'professors': professors,
      'categories': categories,
      'subjects': subjects!
          .map((subject) => (subject as SubjectModel).toJson())
          .toList(),
    };
  }

  CourseModel copyWith({
    int? id,
    List<SubjectModel>? subjects,
    List<String>? categories,
    String? img,
    DateTime? launchDate,
    String? longDesc,
    List<String>? professors,
    String? shortDesc,
    String? title,
    int? totalStudentsEnrolled,
  }) {
    return CourseModel(
      id: id ?? this.id,
      subjects: subjects ?? (this.subjects as List<SubjectModel>),
      categories: categories ?? this.categories,
      img: img ?? this.img,
      launchDate: launchDate ?? this.launchDate,
      longDesc: longDesc ?? this.longDesc,
      professors: professors ?? this.professors,
      shortDesc: shortDesc ?? this.shortDesc,
      title: title ?? this.title,
      totalStudentsEnrolled:
          totalStudentsEnrolled ?? this.totalStudentsEnrolled,
    );
  }
}
