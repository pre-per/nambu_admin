import 'package:flutter/material.dart';
import 'package:nambu_admin/component/noticecard.dart';
import 'package:nambu_admin/main.dart';
import 'package:nambu_admin/screen/sub/bathscreen.dart';
import 'package:nambu_admin/screen/sub/deliveryscreen.dart';

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
                  children: [
                    Noticecard(
                      backgroundColor: Color(0xffffc2bd),
                      title: '공지사항을 확인하세요',
                      iconData: Icons.emergency,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomescreenBathInkWell(w_mdof, context),
                        HomescreenDeliveryInkWell(w_mdof, context),
                      ],
                    ),
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

InkWell HomescreenBathInkWell(double w_mdof, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Bathscreen()));
    },
    child: Ink(
      width: w_mdof * 0.45,
      height: w_mdof * 0.45,
      decoration: BoxDecoration(
        color: Colors.orange[400],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('목욕탕',
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
      width: w_mdof * 0.45,
      height: w_mdof * 0.45,
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('도시락 배달',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}
