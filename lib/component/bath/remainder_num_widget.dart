import 'package:flutter/material.dart';
import 'package:nambu_admin/provider/bath/remainder_provider.dart';
import 'package:provider/provider.dart';

class RemainderNumWidget extends StatelessWidget {
  final String category;

  const RemainderNumWidget({required this.category, super.key});

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
    return Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
              child: Center(
                child: Text(
                  categoryToKorean(),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
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
        Divider(),
      ],
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

    void increment() {
      if (text == '치약') {
        provider.updateToothpasteNum(category, num + 1);
      } else if (text == '샴푸') {
        provider.updateShampooNum(category, num + 1);
      } else if (text == '비누') {
        provider.updateSoapNum(category, num + 1);
      }
    }

    void decrement() {
      if (text == '치약') {
        provider.updateToothpasteNum(category, num - 1);
      } else if (text == '샴푸') {
        provider.updateShampooNum(category, num - 1);
      } else if (text == '비누') {
        provider.updateSoapNum(category, num - 1);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
        const SizedBox(width: 25.0),
        Expanded(
            child: Text(
          text,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        )),
        IconButton(onPressed: decrement, icon: Icon(Icons.remove)),
        Text(
          '$num개',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        IconButton(onPressed: increment, icon: Icon(Icons.add)),
      ],
    );
  }
}
