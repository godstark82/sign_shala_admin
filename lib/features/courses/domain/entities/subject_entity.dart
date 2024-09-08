import 'package:admin_sign_shala/features/courses/domain/entities/chapter_entity.dart';

class SubjectEntity {
  String? title;
  String? shortDesc;
  String? img;
  List<ChapterEntity>? chapters;

  SubjectEntity({
    this.img,
    this.shortDesc,
    this.title,
    this.chapters,
  });
}
