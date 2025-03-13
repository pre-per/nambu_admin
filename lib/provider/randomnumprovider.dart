import 'package:flutter/cupertino.dart';
import 'dart:math';

class RandomnumProvider with ChangeNotifier {
  int _maxNum = 40;
  int _drawedNum = 0;
  bool _showConfetti = false;
  bool _randomBool = false;
  bool _isAnimating = false;

  int get maxNum => _maxNum;
  int get drawedNum => _drawedNum;
  bool get showConfetti => _showConfetti;
  bool get randomBool => _randomBool;
  bool get isAnimating => _isAnimating;

  void setMaxNum(int num) {
    _maxNum = num;
    notifyListeners();
  }

  void drawNum() {
    Random random = Random();
    _drawedNum = random.nextInt(_maxNum) + 1;
    _randomBool = Random().nextBool();
    startAnimation();
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

  void startAnimation() {
    _isAnimating = true;
    notifyListeners();
    Future.delayed(Duration(milliseconds: 300), () {
      _isAnimating = false;
      notifyListeners();
    });
  }
}