import 'package:admin_sign_shala/features/courses/domain/entities/subject_entity.dart';
import 'chapter_model.dart';

class SubjectModel extends SubjectEntity {
  SubjectModel({
    String? img,
    String? shortDesc,
    String? title,
    List<ChapterModel>? chapters,
  }) : super(
          img: img,
          shortDesc: shortDesc,
          title: title,
          chapters: chapters,
        );

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      img: json['img'],
      shortDesc: json['shortDesc'],
      title: json['title'],
      chapters: (json['chapters'] as List)
          .map((chapter) => ChapterModel.fromJson(chapter))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'shortDesc': shortDesc,
      'title': title,
      'chapters': chapters
          ?.map((chapter) => (chapter as ChapterModel).toJson())
          .toList(),
    };
  }
}
