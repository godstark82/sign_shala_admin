import 'dart:developer';

import 'package:admin_sign_shala/features/courses/domain/entities/course_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'subject_model.dart';

class CourseModel {
  String? id;
  List<SubjectModel>? subjects;
  List<String>? categories;
  String? img;
  DateTime? launchDate;
  String? longDesc;
  List<String>? professors;
  String? shortDesc; //*
  String? title; //*
  int? totalStudentsEnrolled;
  CourseModel({
    this.categories,
    this.img,
    this.launchDate,
    this.longDesc,
    this.professors,
    this.shortDesc,
    this.title,
    this.totalStudentsEnrolled,
    this.subjects,
    this.id,
  });

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

  Map<String, dynamic> toJsonBasics() {
    return {
      'id': id,
      'title': title,
      'shortDesc': shortDesc,
      'longDesc': longDesc,
      'img': img,
      'totalStudentsEnrolled': totalStudentsEnrolled,
      'launchDate': launchDate?.toIso8601String(),
    };
  }

  CourseModel copyWith({
    String? id,
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

  // Function to upload course and nested collections to Firestore
  Future<void> uploadCourseToFirestore() async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection('courses');

    try {
      // 1. Add basic course details to Firestore and get the document reference
      DocumentReference courseDocRef = await courses.add(toJsonBasics());

      // 2. Add subjects as subcollections under the course document
      if (subjects != null) {
        for (SubjectModel subject in subjects! as List<SubjectModel>) {
          await subject.uploadSubjectToFirestore(courseDocRef);
        }
      }

      log('Course uploaded successfully with subjects!');
    } catch (e) {
      log('Failed to upload course: $e');
    }
  }
}
