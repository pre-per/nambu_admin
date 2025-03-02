import 'package:flutter/material.dart';

class Noticescreen extends StatelessWidget {
  const Noticescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoticescreenAppBar(),
    );
  }
}

AppBar NoticescreenAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(' 📌 중요! 공지사항을 확인하세요', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),),
    centerTitle: false,
  );
}