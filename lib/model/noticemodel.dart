import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nambu_admin/model/categorymodel.dart';

class NoticeModel {
  String docId;
  String title;
  String dateTime;
  String description;
  CategoryModel category;

  NoticeModel({
    this.docId = '',
    this.title = "",
    this.dateTime = "00-00-00",
    this.description = "",
    CategoryModel? category,
  }) : category = category ?? CategoryModel();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'dateTime': dateTime,
      'description': description,
      'category': category.toMap(),
    };
  }

  factory NoticeModel.fromMap(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return NoticeModel(
      docId: doc.id,
      title: map['title'] ?? "Untitled",
      dateTime: map['dateTime'] ?? "00-00-00",
      description: map['description'] ?? "Empty",
      category: CategoryModel.fromMap(map['category']),
    );
  }
}
