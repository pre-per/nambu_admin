import 'package:flutter/material.dart';
import 'package:nambu_admin/provider/bath/remainder_provider.dart';
import 'package:provider/provider.dart';

class BathCategoryDetails extends StatelessWidget {
  final String category;

  const BathCategoryDetails({required this.category, super.key});

  String categoryToKorean() {
    if (category == 'total') {
      return '전체';
    } else if (category == 'men') {
      return '남탕';
    } else if (category == 'women') {
      return '여탕';
    } else if (category == 'office') {
      return '사무실';
    } else {
      return '오류';
    }
  }

  Color? categoryToColor() {
    if (category == 'total') {
      return Colors.yellow[100];
    } else if (category == 'men') {
      return Colors.blue[100];
    } else if (category == 'women') {
      return Colors.red[100];
    } else if (category == 'office') {
      return Colors.green[100];
    } else {
      return Colors.brown[200];
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RemainderProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18.0),
                IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: categoryToColor(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.0),
                      child: Center(
                        child: Text(
                          categoryToKorean(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/tooth.png',
                  text: '치약',
                  num: provider.remainders[category]?.toothpasteNum ?? -1,
                  category: category,
                ),
                const SizedBox(height: 18.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/shampoo.png',
                  text: '샴푸',
                  num: provider.remainders[category]?.shampooNum ?? -1,
                  category: category,
                ),
                const SizedBox(height: 18.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/soap.png',
                  text: '비누',
                  num: provider.remainders[category]?.soapNum ?? -1,
                  category: category,
                ),
                const SizedBox(height: 18.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/bodyLotion.png',
                  text: '바디로션',
                  num: provider.remainders[category]?.bodyLotionNum ?? -1,
                  category: category,
                ),
                const SizedBox(height: 18.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/skinLotion.png',
                  text: '스킨로션',
                  num: provider.remainders[category]?.skinLotionNum ?? -1,
                  category: category,
                ),
                const SizedBox(height: 18.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/showerTowel.png',
                  text: '때타월',
                  num: provider.remainders[category]?.showerTowelNum ?? -1,
                  category: category,
                ),
                const SizedBox(height: 18.0),
                Icon_Name_Num_Row(
                  imageString: 'asset/image/icon/towel.png',
                  text: '수건',
                  num: provider.remainders[category]?.towelNum ?? -1,
                  category: category,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Icon_Name_Num_Row extends StatelessWidget {
  final String imageString;
  final String text;
  final int num;
  final String category;

  const Icon_Name_Num_Row({
    required this.imageString,
    required this.text,
    required this.num,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RemainderProvider>(context, listen: false);

    final updateFuncMap = {
      '치약': provider.updateToothpasteNum,
      '샴푸': provider.updateShampooNum,
      '비누': provider.updateSoapNum,
      '바디로션': provider.updateBodyLotionNum,
      '스킨로션': provider.updateSkinLotionNum,
      '때타월': provider.updateShowerTowelNum,
      '수건': provider.updateTowelNum,
    };

    void increment() {
      if (updateFuncMap[text] != null) {
        updateFuncMap[text]!(category, num + 1);
      }
    }

    void increment10() {
      if (updateFuncMap[text] != null) {
        updateFuncMap[text]!(category, num + 10);
      }
    }

    void decrement() {
      if (updateFuncMap[text] != null && num > 0) {
        updateFuncMap[text]!(category, num - 1);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            increment10();
          },
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Image.asset(imageString),
            ),
          ),
        ),
        const SizedBox(width: 25.0),
        Expanded(
            child: Text(
          text,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        )),
        IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
        Text(
          '$num개',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        IconButton(onPressed: increment, icon: const Icon(Icons.add)),
      ],
    );
  }
}
