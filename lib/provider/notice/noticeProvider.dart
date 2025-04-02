import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nambu_admin/model/categorymodel.dart';
import 'package:nambu_admin/model/noticemodel.dart';

class NoticeProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<NoticeModel> _noticeList = [];
  List<CategoryModel> _noticeCategoryList = [];
  CategoryModel _selectedCategory = CategoryModel();

  List<NoticeModel> get noticeList => _noticeList;
  List<CategoryModel> get noticeCategoryList => _noticeCategoryList;
  CategoryModel get selectedCategory => _selectedCategory;

  void saveNotice() {
    DateTime now = DateTime.now();
    NoticeModel notice = NoticeModel(
      title: titleController.text,
      dateTime:
          '${now.year.toString().substring(2, 4)}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}',
      description: descriptionController.text,
      category: _selectedCategory,
    );
    _addNotice(notice);
  }

  void selectCategory(int index) {
    _selectedCategory = _noticeCategoryList[index];
    notifyListeners();
  }

  Future<void> _addNotice(NoticeModel notice) async {
    DocumentReference docRef =
        await firestore.collection('noticeList').add(notice.toMap());
    notice.docId = docRef.id;
    _clearController();
    notifyListeners();
  }

  void listenToNotice() {
    firestore.collection('noticeList').snapshots().listen((snapshot) {
      _noticeList = snapshot.docs.map((doc) {
        return NoticeModel.fromMap(doc);
      }).toList();
      _sortList();
      notifyListeners();
    });
  }

  void listenToCategory() {
    firestore.collection('noticeCategory').snapshots().listen((snapshot) {
      _noticeCategoryList = snapshot.docs.map((doc) {
        return CategoryModel.fromMap(doc.data());
      }).toList();
      notifyListeners();
    });
  }

  void _sortList() {
    DateFormat format = DateFormat("yy-MM-dd");
    _noticeList.sort(
        (a, b) => format.parse(b.dateTime).compareTo(format.parse(a.dateTime)));
  }

  void _clearController() {
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

