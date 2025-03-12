import 'package:flutter/cupertino.dart';
import 'dart:math';

class RandomnumProvider with ChangeNotifier {
  int _maxNum = 40;
  int _drawedNum = 0;
  bool _showConfetti = false;
  bool _randomBool = false;

  int get maxNum => _maxNum;
  int get drawedNum => _drawedNum;
  bool get showConfetti => _showConfetti;
  bool get randomBool => _randomBool;

  void setMaxNum(int num) {
    _maxNum = num;
    notifyListeners();
  }

  void drawNum() {
    Random random = Random();
    _drawedNum = random.nextInt(_maxNum) + 1;
    _randomBool = Random().nextBool();
    notifyListeners();
  }

  void startConfetti() {
    _showConfetti = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      _showConfetti = false;
      notifyListeners();
    });
  }
}