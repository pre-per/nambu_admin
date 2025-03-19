import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';

class SportpersonProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Sportpersonmodel> _teamList = [];
  int _blueScore = 0;
  int _redScore = 0;

  List<Sportpersonmodel> get teamList => _teamList;

  List<Sportpersonmodel> get blueTeam =>
      _teamList.where((item) => item.isBlueTeam).toList();

  List<Sportpersonmodel> get redTeam =>
      _teamList.where((item) => !(item.isBlueTeam)).toList();

  int get blueCheckedCount => blueTeam.where((item) => item.isChecked).length;

  int get redCheckedCount => redTeam.where((item) => item.isChecked).length;

  int get blueScore => _blueScore;

  int get redScore => _redScore;

  Future<void> toggleCheck(Sportpersonmodel person) async {
    person.isChecked = !person.isChecked;
    await firestore
        .collection('sportUserInfo')
        .doc(person.docId)
        .update({'isChecked': person.isChecked});
    notifyListeners();
  }

  Future<void> addPerson(Sportpersonmodel person) async {
    DocumentReference docRef =
        await firestore.collection('sportUserInfo').add(person.toMap());
    person.docId = docRef.id;
    notifyListeners();
  }

  Future<void> addScore(bool isPlus, bool isBlueTeam) async {
    DocumentSnapshot teamScoreDoc = await firestore
        .collection('sportTeamScore')
        .doc(isBlueTeam ? 'blueTeam' : 'redTeam')
        .get();

    int currentScore =
        (teamScoreDoc.data() as Map<String, dynamic>)['num'] ?? -1;
    int newScore = isPlus ? currentScore + 50 : currentScore - 50;

    await firestore
        .collection('sportTeamScore')
        .doc(isBlueTeam ? 'blueTeam' : 'redTeam')
        .update({'num': newScore});

    if (isBlueTeam) {
      _blueScore = newScore;
      print("Blue Team Score Updated: $_blueScore");
    } else {
      _redScore = newScore;
      print("Red Team Score Updated: $_redScore");
    }

    notifyListeners();
  }

  void listenToUser() {
    firestore.collection('sportUserInfo').snapshots().listen((snapshot) {
      _teamList = snapshot.docs.map((doc) {
        return Sportpersonmodel.fromMap(doc);
      }).toList();
      _sortList();
      notifyListeners();
    });
  }

  void listenToScore() {
    firestore.collection('sportTeamScore').snapshots().listen((snapshot) {
      for (var doc in snapshot.docs) {
        if (doc.id == 'blueTeam') {
          _blueScore = (doc.data()['num'] ?? 0) as int;
        } else if (doc.id == 'redTeam') {
          _redScore = (doc.data()['num'] ?? 0) as int;
        }
      }
      notifyListeners();
    });
  }

  void _sortList() {
    _teamList.sort((a, b) => a.num.compareTo(b.num));
  }
}
