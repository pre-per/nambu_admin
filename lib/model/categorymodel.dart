import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  String title;
  IconData iconData;

  CategoryModel({
    this.id = 0,
    this.title = '',
    IconData? iconData,
  }) : iconData = iconData ?? Icons.notifications_active;
}
