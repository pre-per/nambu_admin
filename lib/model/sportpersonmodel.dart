import 'package:cloud_firestore/cloud_firestore.dart';

class Sportpersonmodel {
  String docId;
  String name;
  String phoneNum;
  int num;
  int adultNum;
  int childNum;
  bool isChecked;
  bool isBlueTeam;


  Sportpersonmodel({
    this.docId = '',
    this.name = '',
    this.num = -1,
    this.adultNum = -1,
    this.childNum = -1,
    this.isChecked = false,
    this.isBlueTeam = true,
    this.phoneNum = '전화번호 기록 없음',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNum': phoneNum,
      'num': num,
      'adultNum': adultNum,
      'childNum': childNum,
      'isChecked': isChecked,
      'isBlueTeam': isBlueTeam,
    };
  }
  factory Sportpersonmodel.fromMap(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return Sportpersonmodel(
      docId: doc.id,
      name: map['name'] ?? 'Untitled',
      phoneNum: map['phoneNum'] ?? '전화번호 기록 없음',
      num: map['num'] ?? -1,
      adultNum: map['adultNum'] ?? -1,
      childNum: map['childNum'] ?? -1,
      isChecked: map['isChecked'] ?? false,
      isBlueTeam: map['isBlueTeam'] ?? true,
    );
  }
}
