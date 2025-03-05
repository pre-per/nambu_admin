import 'package:nambu_admin/model/categorymodel.dart';

class CalendaraddModel {
  String title;
  DateTime dateTime;
  String description;
  CategoryModel category;

  CalendaraddModel({
    this.title = '',
    DateTime? dateTime,
    this.description = '',
    CategoryModel? category,
  })  : dateTime = dateTime ?? DateTime.now(),
        category = category ?? CategoryModel();
}
