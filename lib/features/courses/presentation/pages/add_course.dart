import 'package:admin_sign_shala/core/constants/colors.dart';
import 'package:admin_sign_shala/features/courses/data/models/course_model.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/add_subject_widget.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/basic_couse_details.dart';
import 'package:flutter/material.dart';

//! Temp Course To upload On Firebase Later
CourseModel tempCourse = CourseModel();

class AddNewCoursePage extends StatefulWidget {
  const AddNewCoursePage({super.key});

  @override
  State<AddNewCoursePage> createState() => _AddNewCoursePageState();
}

class _AddNewCoursePageState extends State<AddNewCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicCourseDetailsFormWidget(),
              AddSubjectWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
