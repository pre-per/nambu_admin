import 'package:flutter/material.dart';
import 'package:nambu_admin/component/noticecard.dart';
import 'package:nambu_admin/screen/sub/notice/noticewriting.dart';

class Noticescreen extends StatelessWidget {
  const Noticescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: NoticescreenAppBar(context),
      body: ListView(
        children: [
          Column(
            children: [
              Noticecard(),
              Noticecard(),
              Noticecard(),
              Noticecard(),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar NoticescreenAppBar(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(' 📌 중요! 공지사항을 확인하세요',
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Noticewriting()),
            );
          },
          child: Container(
            width: 60.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Color(0xffffc2bd),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Center(
              child: Text('글쓰기',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
      ],
    ),
    centerTitle: false,
  );
}
