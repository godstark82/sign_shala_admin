import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'chapter_model.dart';

class SubjectModel {
  String? img;
  String? shortDesc;
  String? title;
  List<ChapterModel>? chapters;
  SubjectModel({
    this.chapters,
    this.img,
    this.shortDesc,
    this.title,
  });

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
      'chapters': chapters?.map((chapter) => (chapter).toJson()).toList(),
    };
  }

  // Upload subject to Firestore under a specific course document
  Future<void> uploadSubjectToFirestore(DocumentReference courseDocRef) async {
    CollectionReference subjects = courseDocRef.collection('subjects');

    try {
      DocumentReference subjectDocRef = await subjects.add(toJson());

      // Add chapters as subcollections under the subject document
      if (chapters != null) {
        for (ChapterModel chapter in chapters!) {
          // Assuming all ChapterEntity are actually of type ChapterModel
          await chapter.uploadChapterToFirestore(subjectDocRef);
        }
      }

      log('Subject uploaded successfully with chapters!');
    } catch (e) {
      log('Failed to upload subject: $e');
    }
  }
}
