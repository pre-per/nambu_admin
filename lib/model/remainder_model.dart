import 'package:cloud_firestore/cloud_firestore.dart';

class RemainderModel {
  int toothpasteNum;
  int shampooNum;
  int soapNum;
  int bodyLotionNum;
  int skinLotionNum;
  int showerTowelNum;
  int towelNum;
  int tissueNum;

  RemainderModel({
    this.toothpasteNum = 0,
    this.shampooNum = 0,
    this.soapNum = 0,
    this.bodyLotionNum = 0,
    this.skinLotionNum = 0,
    this.showerTowelNum = 0,
    this.towelNum = 0,
    this.tissueNum = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'toothpasteNum': toothpasteNum,
      'shampooNum': shampooNum,
      'soapNum': soapNum,
      'bodyLotionNum': bodyLotionNum,
      'skinLotionNum': skinLotionNum,
      'showerTowelNum': showerTowelNum,
      'towelNum': towelNum,
      'tissueNum': tissueNum,
    };
  }
  factory RemainderModel.fromMap(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return RemainderModel(
      toothpasteNum: map['toothpasteNum'] ?? 0,
      shampooNum: map['shampooNum'] ?? 0,
      soapNum: map['soapNum'] ?? 0,
      bodyLotionNum: map['bodyLotionNum'] ?? 0,
      skinLotionNum: map['skinLotionNum'] ?? 0,
      showerTowelNum: map['showerTowelNum'] ?? 0,
      towelNum: map['towelNum'] ?? 0,
      tissueNum: map['tissueNum'] ?? 0,
    );
  }
}
