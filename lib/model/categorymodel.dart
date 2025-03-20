import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String title;
  IconData iconData;

  CategoryModel({
    this.title = "Untitled",
    this.iconData = Icons.notifications_active,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'iconData': iconData.codePoint,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] ?? 'Untitled',
      iconData: IconData(
          map['iconData'] ?? Icons.notifications_active.codePoint,
          fontFamily: 'MaterialIcons'),
    );
  }
}
