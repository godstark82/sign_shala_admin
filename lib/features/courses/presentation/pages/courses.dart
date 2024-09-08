import 'package:admin_sign_shala/core/constants/colors.dart';
import 'package:admin_sign_shala/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Courses'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GFButton(
              onPressed: () {
                Get.toNamed(Routes.addCourse);
              },
              text: 'New Course',
            ),
          )
        ],
      ),
    );
  }
}
