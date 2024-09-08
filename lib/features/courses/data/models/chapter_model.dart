import 'package:admin_sign_shala/features/courses/domain/entities/chapter_entity.dart';

class ChapterModel extends ChapterEntity {
  ChapterModel({
     String ? title,
     List<ChapterWordModel> ? words,
  }) : super(
          title: title,
          words: words,
        );

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      title: json['title'],
      words: (json['words'] as List)
          .map((word) => ChapterWordModel.fromJson(word))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'words':
          (words ?? []).map((word) => (word as ChapterWordModel).toJson()).toList(),
    };
  }
}

class ChapterWordModel extends ChapterWordEntity {
  ChapterWordModel({
    String? img,
     String ? name,
     String ? videoUrl,
  }) : super(
          img: img,
          name: name,
          videoUrl: videoUrl,
        );

  factory ChapterWordModel.fromJson(Map<String, dynamic> json) {
    return ChapterWordModel(
      img: json['img'],
      name: json['name'],
      videoUrl: json['videoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'name': name,
      'videoUrl': videoUrl,
    };
  }
}
