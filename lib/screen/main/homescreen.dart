import 'package:flutter/material.dart';
import 'package:nambu_admin/component/noticecard.dart';
import 'package:nambu_admin/main.dart';
import 'package:nambu_admin/screen/sub/bathscreen.dart';
import 'package:nambu_admin/screen/sub/deliveryscreen.dart';
import 'package:nambu_admin/screen/sub/sport/sportscreen.dart';

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
                    HomescreenSportsInkWell(w_mdof, context),
                    const SizedBox(height: 20.0),
                    HomescreenBathInkWell(w_mdof, context),
                    const SizedBox(height: 20.0),
                    HomescreenDeliveryInkWell(w_mdof, context),
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

InkWell HomescreenSportsInkWell(double w_mdof, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Sportscreen()));
    },
    child: Ink(
      width: w_mdof,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFFFD1DC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('봄 운동회 바로가기',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}

InkWell HomescreenBathInkWell(double w_mdof, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Bathscreen()));
    },
    child: Ink(
      width: w_mdof,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFFFDAC1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('목욕탕 바로가기',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}

InkWell HomescreenDeliveryInkWell(double w_mdof, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Deliveryscreen()));
    },
    child: Ink(
      width: w_mdof,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFC4F4C4),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('도시락 배달 바로가기',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}
