import 'package:flutter/material.dart';

class Noticedetails extends StatelessWidget {
  String title;
  
  Noticedetails({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoticedetailsAppBar(title),
      body: ListView(
        children: [
          Column(
            children: [
              Text('data')
            ],
          )
        ],
      ),
    );
  }
}

AppBar NoticedetailsAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        )),
  );
}
