import 'dart:developer';

import 'package:admin_sign_shala/core/constants/colors.dart';
import 'package:admin_sign_shala/features/courses/data/models/course_model.dart';
import 'package:admin_sign_shala/features/courses/data/repositories/course_repo_impl.dart';
import 'package:admin_sign_shala/features/courses/domain/repositories/course_repo.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/add_subject_widget.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/basic_couse_details.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';

//! Temp Course To upload On Firebase Later
CourseModel? tempCourse = CourseModel();

class AddNewCoursePage extends StatefulWidget {
  const AddNewCoursePage({super.key});

  @override
  State<AddNewCoursePage> createState() => _AddNewCoursePageState();
}

class _AddNewCoursePageState extends State<AddNewCoursePage> {
  final GlobalKey<FormState> basicDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> subjectFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Add Course'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GFButton(
                onPressed: () async {
                  CourseRepo repo = CourseRepoImpl();
                  if (basicDetailsFormKey.currentState!.validate() &&
                      subjectFormKey.currentState!.validate()) {
                    if (tempCourse!.subjects != null) {
                      await repo.addNewCourse(tempCourse!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Please Add Minimum 1 Subject',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                      log('Please Add Minimum 1 Subject');
                    }
                  } else {
                    log('Form Not Validated');
                  }
                },
                text: 'Save Course'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicCourseDetailsFormWidget(formKey: basicDetailsFormKey),
              AddSubjectWidget(formKey: subjectFormKey),
            ],
          ),
        ),
      ),
    );
  }
}
