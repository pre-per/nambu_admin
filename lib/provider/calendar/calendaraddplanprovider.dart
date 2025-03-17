import 'package:flutter/material.dart';
import 'package:nambu_admin/model/calendaraddmodel.dart';
import 'package:nambu_admin/model/categorymodel.dart';

class Calendaraddplanprovider with ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  CalendaraddModel _addCalendar = CalendaraddModel();
  List<CategoryModel> _category = [
    CategoryModel(title: 'hello1'),
    CategoryModel(title: 'hello2'),
    CategoryModel(title: 'hello3'),
    CategoryModel(title: 'hello4'),
  ];
  CategoryModel _selectedCategory = CategoryModel();

  CalendaraddModel get addCalendar => _addCalendar;

  List<CategoryModel> get category => _category;

  CategoryModel get selectedCategory => _selectedCategory;

  DateTime get dateTime => _addCalendar.dateTime;

  Future<void> pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _addCalendar.dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_addCalendar.dateTime),
    );

    if (pickedTime == null) return;

    _addCalendar.dateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    notifyListeners();
  }

  void selectCategory(int index) {
    _selectedCategory = _category[index];
    print("SelectedCategory: ${_selectedCategory.title}");
    notifyListeners();
  }

  void saveNotice() {
    _addCalendar = CalendaraddModel(
      title: titleController.text,
      dateTime: _addCalendar.dateTime,
      description: descriptionController.text,
    );
    notifyListeners();
    print(
        "저장된 공지: ${_addCalendar.title}, ${_addCalendar.dateTime}, ${_addCalendar.description}");
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
