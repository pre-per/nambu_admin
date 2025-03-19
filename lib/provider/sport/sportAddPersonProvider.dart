import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';

class SportAddPersonProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  int _adultNum = 0;
  int _childNum = 0;
  bool _isBlueTeam = true;

  int get adultNum => _adultNum;
  int get childNum => _childNum;
  bool get isBlueTeam => _isBlueTeam;

  void addAdultChildNum(bool isPlus, bool isAdult) {
    if (isAdult) {
      isPlus ? _adultNum++ : _adultNum--;
    } else {
      isPlus ? _childNum++ : _childNum--;
    }
    notifyListeners();
  }

  void setTeam(bool isBlueTeam) {
    _isBlueTeam = isBlueTeam;
    notifyListeners();
  }

  Sportpersonmodel saveTeam() {
    final phoneNumBefore = phoneNumController.text;
    return Sportpersonmodel(
      name: nameController.text,
      phoneNum: '${phoneNumBefore.substring(0, 3)}-${phoneNumBefore.substring(3, 7)}-${phoneNumBefore.substring(7, 11)}',
      num: int.parse(numController.text),
      adultNum: _adultNum,
      childNum: _childNum,
      isBlueTeam: _isBlueTeam,
      isChecked: false,
    );
  }

  void clearController() {
    nameController.clear();
    phoneNumController.clear();
    numController.clear();
  }
}