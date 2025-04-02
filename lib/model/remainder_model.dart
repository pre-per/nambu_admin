import 'package:cloud_firestore/cloud_firestore.dart';

class RemainderModel {
  int toothpasteNum;
  int shampooNum;
  int soapNum;

  RemainderModel({
    this.toothpasteNum = 0,
    this.shampooNum = 0,
    this.soapNum = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'toothpasteNum': toothpasteNum,
      'shampooNum': shampooNum,
      'soapNum': soapNum,
    };
  }
  factory RemainderModel.fromMap(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return RemainderModel(
      toothpasteNum: map['toothpasteNum'] ?? 0,
      shampooNum: map['shampooNum'] ?? 0,
      soapNum: map['soapNum'] ?? 0,
    );
  }
}
