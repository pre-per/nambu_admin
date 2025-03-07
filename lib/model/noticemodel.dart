import 'package:nambu_admin/model/categorymodel.dart';

class NoticeModel {
  String title;
  DateTime dateTime;
  String description;
  CategoryModel category;

  NoticeModel({
    this.title = "",
    DateTime? dateTime,
    this.description = "",
    CategoryModel? category,
  })  : dateTime = DateTime.now(),
        category = category ?? CategoryModel();
}
