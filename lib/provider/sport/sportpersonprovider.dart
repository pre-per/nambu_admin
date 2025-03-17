import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';

class SportpersonProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Sportpersonmodel> _teamList = [];
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

  void listentoUser() {
    firestore.collection('sportUserInformation').snapshots().listen((snapshot) {
      _teamList = snapshot.docs.map((doc) {
        return Sportpersonmodel.fromMap(doc.data());
      }).toList();

      notifyListeners();
    });
  }
}
