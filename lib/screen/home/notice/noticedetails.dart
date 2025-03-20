import 'package:flutter/material.dart';
import 'package:nambu_admin/model/noticemodel.dart';

class NoticeDetails extends StatelessWidget {
  final NoticeModel notice;
  
  NoticeDetails({required this.notice, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoticedetailsAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25.0),
                Text(notice.title, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
                const SizedBox(height: 15.0),
                Text(notice.dateTime, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey[600]),),
                const SizedBox(height: 20.0),
                Divider(color: Colors.grey[400], thickness: 0.7),
                const SizedBox(height: 25.0),
                Text('안녕하세요, 남부종합사회복지관입니다.\n', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey[900]),),
                Text(notice.description, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey[900]),),
                Text('\n\n감사합니다.\n\n남부종합사회복지관 드림', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey[900]),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

AppBar NoticedetailsAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text('공지사항',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        )),
  );
}
