import 'package:flutter/material.dart';
import 'package:nambu_admin/screen/bath/bath_category_details.dart';

class Bathscreen extends StatelessWidget {
  const Bathscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BathscreenAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            BathRemainderWidget(),
          ],
        ),
      ),
    );
  }
}

AppBar BathscreenAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    title: Text('목욕탕',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        )),
  );
}

class BathRemainderWidget extends StatelessWidget {
  const BathRemainderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25.0),
        Text(
          '잔여 물품',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BathInkWell(text: '전체', color: Colors.yellow[100]),
            BathInkWell(text: '사무실', color: Colors.green[100]),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BathInkWell(text: '남탕', color: Colors.blue[100]),
            BathInkWell(text: '여탕', color: Colors.red[100]),
          ],
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}

class BathInkWell extends StatelessWidget {
  final String text;
  final Color? color;

  const BathInkWell({required this.text, required this.color, super.key});

  String textToCategory(String text) {
    switch (text) {
      case '전체':
        return 'total';
      case '사무실':
        return 'office';
      case '남탕':
        return 'men';
      case '여탕':
        return 'women';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          final category = textToCategory(text);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BathCategoryDetails(category: category),
            ),
          );
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Ink(
          height: 100,
          width: MediaQuery.of(context).size.width* 0.4,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
