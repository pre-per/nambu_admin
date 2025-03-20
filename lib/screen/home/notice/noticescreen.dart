import 'package:flutter/material.dart';
import 'package:nambu_admin/screen/home/notice/noticewriting.dart';
import 'package:nambu_admin/component/noticeCard.dart';

class Noticescreen extends StatelessWidget {
  const Noticescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoticescreenAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                NoticeCard(title: 'test1', date: '2025-03-20'),
                NoticeCard(title: 'test2', date: '2025-03-20'),
                NoticeCard(title: 'test3', date: '2025-03-20'),
                NoticeCard(title: 'test4', date: '2025-03-20'),
              ],
            ),
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
        Text('공지사항',
            style: TextStyle(
                fontSize: 20.0,
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
