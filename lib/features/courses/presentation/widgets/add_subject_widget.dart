import 'package:admin_sign_shala/features/courses/data/models/subject_model.dart';
import 'package:admin_sign_shala/features/courses/presentation/pages/add_course.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/add_chapter_widget.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSubjectWidget extends StatefulWidget {
  const AddSubjectWidget({super.key});

  @override
  State<AddSubjectWidget> createState() => _AddSubjectWidgetState();
}

class _AddSubjectWidgetState extends State<AddSubjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: context.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subjects (${tempCourse.subjects?.length ?? 0})',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  tempCourse.subjects ??= [];
                  tempCourse.subjects?.add(SubjectModel());
                  setState(() {});
                },
              )
            ],
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 10),
          ListView.separated(
              shrinkWrap: true,
              itemCount: tempCourse.subjects?.length ?? 0,
              separatorBuilder: (context, index) => Divider(
                    color: Colors.red,
                  ),
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tempCourse.subjects![index].title ?? 'Subject Name',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey.shade900),
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                              name: 'Subject Name',
                              onChanged: (v) => setState(() {
                                    tempCourse.subjects![index].title = v;
                                  })),
                          CustomTextField(
                              name: 'Description',
                              onChanged: (v) => setState(() {
                                    tempCourse.subjects![index].title = v;
                                  })),
                          CustomTextField(
                              name: 'Image (Optional)',
                              onChanged: (v) => setState(() {
                                    tempCourse.subjects![index].title = v;
                                  })),

                          //! Chapters Form
                          AddChapterWidget(index: index),
                        ]));
              })
        ],
      ),
    );
  }
}
