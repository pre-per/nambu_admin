import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';

class SportpersonProvider with ChangeNotifier {
  List<Sportpersonmodel> _teamList = [
    Sportpersonmodel(name: '청짱구', num: 1, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: '청철수', num: 2, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: '청맹구', num: 3, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: '청훈이', num: 4, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: '홍짱구', num: 1, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: '홍철수', num: 2, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: '홍맹구', num: 3, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: '홍훈이', num: 4, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: '홍홍홍', num: 5, isChecked: false, isBlueTeam: false),
  ];

  List<Sportpersonmodel> _blueTeam = [
    Sportpersonmodel(name: '청짱구', num: 1, isChecked: false),
    Sportpersonmodel(name: '청철수', num: 2, isChecked: false),
    Sportpersonmodel(name: '청맹구', num: 3, isChecked: false),
    Sportpersonmodel(name: '청훈이', num: 4, isChecked: false),
  ];

  List<Sportpersonmodel> _redTeam = [
    Sportpersonmodel(name: '홍짱구', num: 1, isChecked: false),
    Sportpersonmodel(name: '홍철수', num: 2, isChecked: false),
    Sportpersonmodel(name: '홍맹구', num: 3, isChecked: false),
    Sportpersonmodel(name: '홍훈이', num: 4, isChecked: false),
    Sportpersonmodel(name: '홍홍홍', num: 5, isChecked: false),
  ];

  bool _isBlueTeam = true;

  List<Sportpersonmodel> get list => _isBlueTeam ? _blueTeam : _redTeam;

  bool get isBlueTeam => _isBlueTeam;

  List<Sportpersonmodel> get blueTeam => _blueTeam;

  List<Sportpersonmodel> get redTeam => _redTeam;

  int get blueCheckedCount => _blueTeam.where((item) => item.isChecked).length;

  int get redCheckedCount => _redTeam.where((item) => item.isChecked).length;

  void switchTeam(bool isBlue) {
    _isBlueTeam = isBlue;
    notifyListeners();
  }

  void toggleCheck(int index) {
    if (_isBlueTeam) {
      _blueTeam[index].isChecked = !_blueTeam[index].isChecked;
    } else {
      _redTeam[index].isChecked = !_redTeam[index].isChecked;
    }
    notifyListeners();
  }
}
