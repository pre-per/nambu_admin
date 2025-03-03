import 'package:flutter/material.dart';

class Calendarprovider with ChangeNotifier {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;

  void updateSelectedDay(DateTime selectedDay) {
    _selectedDay = selectedDay;
    _focusedDay = selectedDay;
    notifyListeners();
  }
}