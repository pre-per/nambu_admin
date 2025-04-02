import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nambu_admin/model/remainder_model.dart';

class RemainderProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Map<String, RemainderModel> _remainders = {
    'men': RemainderModel(),
    'women': RemainderModel(),
    'office': RemainderModel(),
    'total': RemainderModel(),
  };

  Map<String, RemainderModel> get remainders => _remainders;

  /// 모든 문서 불러오기
  Future<void> fetchAllRemainders() async {
    try {
      final categories = ['men', 'women', 'office', 'total'];
      for (String category in categories) {
        DocumentSnapshot doc = await firestore
            .collection('bathRemainder')
            .doc(category)
            .get();
        if (doc.exists) {
          _remainders[category] = RemainderModel.fromMap(doc);
        }
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching remainders: $e");
    }
  }

  /// 특정 카테고리의 데이터 업데이트
  Future<void> updateRemainder(String category, RemainderModel updated) async {
    try {
      await firestore
          .collection('bathRemainder')
          .doc(category)
          .set(updated.toMap());
      _remainders[category] = updated;
      updateTotal();
      notifyListeners();
    } catch (e) {
      print("Error updating $category remainder: $e");
    }
  }

  // 전체 수 업데이트
  void updateTotal() {
    final men = _remainders['men'];
    final women = _remainders['women'];
    final office = _remainders['office'];

    if (men == null || women == null || office == null) return;

    final total = RemainderModel(
      toothpasteNum: men.toothpasteNum + women.toothpasteNum + office.toothpasteNum,
      shampooNum: men.shampooNum + women.shampooNum + office.shampooNum,
      soapNum: men.soapNum + women.soapNum + office.soapNum,
      bodyLotionNum: men.bodyLotionNum + women.bodyLotionNum + office.bodyLotionNum,
      skinLotionNum: men.skinLotionNum + women.skinLotionNum + office.skinLotionNum,
      showerTowelNum: men.showerTowelNum + women.showerTowelNum + office.showerTowelNum,
      towelNum: men.towelNum + women.towelNum + office.towelNum,
      tissueNum: men.tissueNum + women.tissueNum + office.tissueNum,
    );

    updateRemainder('total', total);
  }


  /// 개별 수량 업데이트 함수들 (총 7개 항목)
  void updateToothpasteNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.toothpasteNum = newValue;
    updateRemainder(category, current);
  }

  void updateShampooNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.shampooNum = newValue;
    updateRemainder(category, current);
  }

  void updateSoapNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.soapNum = newValue;
    updateRemainder(category, current);
  }

  void updateBodyLotionNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.bodyLotionNum = newValue;
    updateRemainder(category, current);
  }

  void updateSkinLotionNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.skinLotionNum = newValue;
    updateRemainder(category, current);
  }

  void updateShowerTowelNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.showerTowelNum = newValue;
    updateRemainder(category, current);
  }

  void updateTowelNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.towelNum = newValue;
    updateRemainder(category, current);
  }

  void updateTissueNum(String category, int newValue) {
    final current = _remainders[category];
    if (current == null) return;
    current.tissueNum = newValue;
    updateRemainder(category, current);
  }
}
