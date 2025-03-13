import 'package:flutter/material.dart';
import 'package:nambu_admin/component/noticecard.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/main.dart';
import 'package:nambu_admin/screen/sub/calendar/calendarscreen.dart';
import 'package:nambu_admin/screen/sub/calendar/noticescreen.dart';
import 'package:nambu_admin/screen/main/bathscreen.dart';
import 'package:nambu_admin/screen/main/deliveryscreen.dart';
import 'package:nambu_admin/screen/main/sportscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;
    final double h_mdof = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: HomescreenAppBar(context),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomescreenGallery(w_mdof),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Noticecard(
                      backgroundColor: Color(0xffffc2bd),
                      title: '공지사항을 확인하세요',
                      iconData: Icons.emergency,
                    ),
                    const SizedBox(height: 20.0),
                    HomescreenCalendarInkWell(w_mdof, context),
                    const SizedBox(height: 20.0),
                    HomescreenNoticeInkWell(w_mdof, context),
                    const SizedBox(height: 20.0),
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
      width: w_mdof,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFFFD1DC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('캘린더 바로가기',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}

InkWell HomescreenNoticeInkWell(double w_mdof , BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Noticescreen()));
    },
    child: Ink(
      width: w_mdof,
      height: 70.0,
      decoration: BoxDecoration(
        color: AWESOME_GREEN,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('공지화면 바로가기',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}