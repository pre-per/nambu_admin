import 'package:flutter/material.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/provider/notice/noticeProvider.dart';
import 'package:nambu_admin/screen/home/notice/noticewriting.dart';
import 'package:nambu_admin/component/noticeCard.dart';
import 'package:provider/provider.dart';

class Noticescreen extends StatelessWidget {
  const Noticescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoticeProvider>(context);
    return Scaffold(
      appBar: NoticescreenAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: provider.noticeList.length,
                  itemBuilder: (context, index) {
                    return NoticeCard(
                        title: provider.noticeList[index].title,
                        date: provider.noticeList[index].dateTime);
                  }),
            ),
          ],
        ),
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
            print(Provider.of<NoticeProvider>(context, listen: false).noticeList.length);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Noticewriting()),
            );
          },
          child: Container(
            width: 100.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: MAIN_YELLOW_COLOR,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Center(
              child: Text('공지 작성하기',
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
