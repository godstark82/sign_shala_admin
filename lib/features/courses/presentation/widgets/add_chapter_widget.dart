import 'package:admin_sign_shala/features/courses/data/models/chapter_model.dart';
import 'package:admin_sign_shala/features/courses/presentation/pages/add_course.dart';
import 'package:admin_sign_shala/features/courses/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChapterWidget extends StatefulWidget {
  final int index;
  const AddChapterWidget({super.key, required this.index});

  @override
  State<AddChapterWidget> createState() => _AddChapterWidgetState();
}

class _AddChapterWidgetState extends State<AddChapterWidget> {
  int get index => widget.index;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: context.width,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
                'Chapters (${tempCourse!.subjects![index].chapters?.length ?? 0})',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  tempCourse!.subjects![index].chapters ??= [];
                  tempCourse!.subjects![index].chapters?.add(ChapterModel());
                  setState(() {});
                })
          ]),
          ListView.separated(
              shrinkWrap: true,
              itemCount: tempCourse!.subjects?[index].chapters?.length ?? 0,
              separatorBuilder: (context, index)=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(height: 2,color: Colors.blue,),
              ),
              itemBuilder: (context, chapterIdx) {
                return Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.35))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chapter: ${chapterIdx + 1}'),
                      CustomTextField(
                          name: 'Chapter Name',
                          onChanged: (v) => tempCourse!.subjects?[index]
                              .chapters?[chapterIdx].title = v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Words',style: TextStyle(fontSize: 17),),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  tempCourse!.subjects?[index]
                                      .chapters?[chapterIdx].words ??= [];
                                  tempCourse!.subjects?[index]
                                      .chapters?[chapterIdx].words
                                      ?.add(ChapterWordModel());
                                });
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemCount: tempCourse!.subjects?[index]
                                  .chapters?[chapterIdx].words?.length ??
                              0,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, wordIdx) {
                            final List<Widget> children = [
                              CustomTextField(
                                  name: 'Word Name',
                                  onChanged: (v) => tempCourse!
                                      .subjects?[index]
                                      .chapters?[chapterIdx]
                                      .words?[wordIdx]
                                      .name = v),
                              CustomTextField(
                                  name: 'Video URL',
                                  onChanged: (v) => tempCourse!
                                      .subjects?[index]
                                      .chapters?[chapterIdx]
                                      .words?[wordIdx]
                                      .videoUrl = v),
                              CustomTextField(
                                  name: 'Img Url (Optional)',
                                  onChanged: (v) => tempCourse!
                                      .subjects?[index]
                                      .chapters?[chapterIdx]
                                      .words?[wordIdx]
                                      .img = v),
                            ];
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.cyan)),
                              child: context.width > 750
                                  ? Wrap(children: children)
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: children,
                                    ),
                            );
                          })
                    ],
                  ),
                );
              })
        ]));
  }
}
