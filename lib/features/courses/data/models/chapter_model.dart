import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChapterModel {
  String? title;
  List<ChapterWordModel>? words;
  ChapterModel({
    this.title,
    this.words,
  });

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
      'words': (words ?? []).map((word) => (word).toJson()).toList(),
    };
  }

  Future<void> uploadChapterToFirestore(DocumentReference subjectDocRef) async {
    CollectionReference chapters = subjectDocRef.collection('chapters');

    try {
      DocumentReference chapterDocRef = await chapters.add(toJson());

      // Add chapter words as subcollections under the chapter document
      if (words != null) {
        for (ChapterWordModel word in words!) {
          await word.uploadChapterWordToFirestore(chapterDocRef);
        }
      }

      log('Chapter uploaded successfully with words!');
    } catch (e) {
      log('Failed to upload chapter: $e');
    }
  }
}

class ChapterWordModel {
  String? img;
  String? name;
  String? videoUrl;
  ChapterWordModel({this.img, this.name, this.videoUrl});

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

  Future<void> uploadChapterWordToFirestore(
      DocumentReference chapterDocRef) async {
    CollectionReference words = chapterDocRef.collection('chapterWords');

    try {
      await words.add(toJson());
      log('Chapter word uploaded successfully!');
    } catch (e) {
      log('Failed to upload chapter word: $e');
    }
  }
}
