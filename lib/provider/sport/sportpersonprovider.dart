import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';

class SportpersonProvider with ChangeNotifier {
  List<Sportpersonmodel> _teamList = [
    Sportpersonmodel(name: '짱구', num: 1, adultNum: 5, childNum: 2, isChecked: false, isBlueTeam: true, phoneNum: '010-1234-5678'),
    Sportpersonmodel(name: 'blue청철수', num: 2, adultNum: 4, childNum: 3, isChecked: false, isBlueTeam: true, phoneNum: '010-5678-1234'),
    Sportpersonmodel(name: 'blue청맹구', num: 3, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: 'blue청훈이', num: 4, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: 'red홍짱구', num: 1, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍철수', num: 2, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍맹구', num: 3, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍훈이', num: 4, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍홍홍', num: 5, isChecked: false, isBlueTeam: false),
  ];
  int _blueScore = 0;
  int _redScore = 0;

  List<Sportpersonmodel> get teamList => _teamList;

  List<Sportpersonmodel> get blueTeam => _teamList.where((item) => item.isBlueTeam).toList();
  List<Sportpersonmodel> get redTeam => _teamList.where((item) => !(item.isBlueTeam)).toList();

  int get blueCheckedCount => blueTeam.where((item) => item.isChecked).length;
  int get redCheckedCount => redTeam.where((item) => item.isChecked).length;

  int get blueScore => _blueScore;
  int get redScore => _redScore;

  void toggleCheck(Sportpersonmodel person) {
    person.isChecked = !person.isChecked;
    notifyListeners();
  }

  void addScore(bool isPlus, bool isBlueTeam) {
    if (isBlueTeam) {
      isPlus ? _blueScore += 50 : _blueScore -= 50;
      print("blue team added");
    } else {
      isPlus ? _redScore += 50 : _redScore -= 50;
      print("red team added");
    }
    notifyListeners();
  }
}
