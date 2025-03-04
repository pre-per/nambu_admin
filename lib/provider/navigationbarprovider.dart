import 'package:flutter/material.dart';

class Navigationbarprovider with ChangeNotifier {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  int get selectedIndex => _selectedIndex;

  PageController get pageController => _pageController;

  void updateIndex(int index) {
    _selectedIndex = index;
    _pageController.jumpToPage(index);
    /* _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1),
      curve: Curves.easeInOut,
    ); */
    notifyListeners();
  }

  void onPageChanged(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
