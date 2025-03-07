import 'package:flutter/material.dart';

class CategoryModel {
  String title;
  IconData iconData;

  CategoryModel({
    this.title = '',
    IconData? iconData,
  }) : iconData = iconData ?? Icons.notifications_active;
}
