import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';

class SportpersonProvider with ChangeNotifier {
  List<Sportpersonmodel> _teamList = [
    Sportpersonmodel(name: 'blue청짱구', num: 1, adultNum: 5, childNum: 2, isChecked: false, isBlueTeam: true, phoneNum: '010-1234-5678'),
    Sportpersonmodel(name: 'blue청철수', num: 2, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: 'blue청맹구', num: 3, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: 'blue청훈이', num: 4, isChecked: false, isBlueTeam: true),
    Sportpersonmodel(name: 'red홍짱구', num: 1, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍철수', num: 2, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍맹구', num: 3, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍훈이', num: 4, isChecked: false, isBlueTeam: false),
    Sportpersonmodel(name: 'red홍홍홍', num: 5, isChecked: false, isBlueTeam: false),
  ];

  List<Sportpersonmodel> get teamList => _teamList;

  List<Sportpersonmodel> get blueTeam => _teamList.where((item) => item.isBlueTeam).toList();
  List<Sportpersonmodel> get redTeam => _teamList.where((item) => !(item.isBlueTeam)).toList();

  int get blueCheckedCount => blueTeam.where((item) => item.isChecked).length;
  int get redCheckedCount => redTeam.where((item) => item.isChecked).length;

  void toggleCheck(Sportpersonmodel person) {
    person.isChecked = !person.isChecked;
    notifyListeners();
  }
}
