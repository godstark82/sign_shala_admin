import 'package:admin_sign_shala/features/courses/presentation/pages/add_course.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BasicCourseDetailsFormWidget extends StatelessWidget {
  const BasicCourseDetailsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Course Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 10),
          Wrap(
            children: [
              CustomTextField(
                  name: 'Course Name', onChanged: (v) => tempCourse.title = v),
              CustomTextField(
                  name: 'Short Description',
                  onChanged: (v) => tempCourse.shortDesc = v),
              CustomTextField(
                  name: 'Long Description',
                  onChanged: (v) => tempCourse.longDesc = v),
              CustomTextField(
                  name: 'Image URL', onChanged: (v) => tempCourse.img = v),
              CustomTextField(
                  name: 'Category', onChanged: (v) => tempCourse.img = v),
            ],
          )
        ],
      ),
    );
  }
}
