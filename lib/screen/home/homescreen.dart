import 'package:flutter/material.dart';
import 'package:nambu_admin/component/noticecard.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/main.dart';
import 'package:nambu_admin/screen/home/calendar/calendarscreen.dart';
import 'package:nambu_admin/screen/home/notice/noticescreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: HomescreenAppBar(context),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomescreenGallery(w_mdof),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    HomescreenTextDesign(
                        text: '공지사항', destination: Noticescreen()),
                    const SizedBox(height: 10.0),
                    HomescreenNoticeCard(title: '남부종합사회복지관 공지', date: '2025-03-19'),
                    HomescreenNoticeCard(title: '남부종합사회복지관 공지', date: '2025-03-19'),
                    HomescreenNoticeCard(title: '남부종합사회복지관 공지', date: '2025-03-19'),
                    Divider(thickness: 0.5, height: 40),
                    HomescreenTextDesign(
                        text: '캘린더', destination: Calendarscreen()),
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

Container HomescreenGallery(double w_mdof) {
  return Container(
    width: w_mdof,
    height: 200.0,
    color: Colors.green[300],
  );
}

InkWell HomescreenCalendarInkWell(double w_mdof, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Calendarscreen()));
    },
    child: Ink(
      width: w_mdof * 0.4,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFFFD1DC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('캘린더',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}

InkWell HomescreenNoticeInkWell(double w_mdof, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Noticescreen()));
    },
    child: Ink(
      width: w_mdof * 0.4,
      height: 100.0,
      decoration: BoxDecoration(
        color: AWESOME_GREEN,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('공지',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}

class HomescreenTextDesign extends StatelessWidget {
  final String text;
  final Widget destination;

  const HomescreenTextDesign(
      {required this.text, required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
    ;
  }
}

class HomescreenNoticeCard extends StatelessWidget {
  final String title;
  final String date;

  const HomescreenNoticeCard(
      {required this.title, required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
              Text(
                date,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
