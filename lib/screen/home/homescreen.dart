import 'package:flutter/material.dart';
import 'package:nambu_admin/component/calendar/calendarwidget.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/main.dart';
import 'package:nambu_admin/provider/notice/noticeProvider.dart';
import 'package:nambu_admin/screen/home/calendar/calendarscreen.dart';
import 'package:nambu_admin/screen/home/notice/noticescreen.dart';
import 'package:nambu_admin/component/noticeCard.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomescreenAppBar(context),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomescreenGalleryWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomescreenNoticeWidget(),
                    Divider(thickness: 0.5, height: 40),
                    HomescreenCalendarWidget(),
                    Divider(thickness: 0.5, height: 40),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar HomescreenAppBar(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    centerTitle: false,
    title: GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Mainscreen()),
          (route) => false,
        );
      },
      child: Image.asset(
        'asset/image/logo.png',
        height: 35.0,
      ),
    ),
  );
}

class HomescreenGalleryWidget extends StatelessWidget {
  const HomescreenGalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      color: Colors.green[300],
    );
  }
}

class HomescreenNoticeWidget extends StatelessWidget {
  const HomescreenNoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final notice = Provider.of<NoticeProvider>(context).noticeList;
    return Column(
      children: [
        HomescreenTextDesign(text: '공지사항', destination: Noticescreen()),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              notice.length > 3 ? 3 : notice.length,
              (index) => NoticeCard(
                  title: notice[index].title, date: notice[index].dateTime)),
        ),
      ],
    );
  }
}

class HomescreenCalendarWidget extends StatelessWidget {
  const HomescreenCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomescreenTextDesign(text: '캘린더', destination: Calendarscreen()),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: CalendarWidget(),
        ),
      ],
    );
  }
}

class HomescreenTextDesign extends StatelessWidget {
  final String text;
  final Widget destination;

  const HomescreenTextDesign(
      {required this.text, required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IntrinsicWidth(
            child: Column(
              children: [
                Text(text,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Divider(color: MAIN_YELLOW_COLOR, height: 3.0, thickness: 3.0),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => destination));
              },
              child: Text(
                '더보기 >',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ))
        ],
      ),
    );
    ;
  }
}
