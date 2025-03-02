import 'package:flutter/material.dart';
import 'package:nambu_admin/main.dart';

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
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 7.0, bottom: 7.0),
                child: HomescreenNoticeContainer(w_mdof),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomescreenBathContainer(w_mdof),
                  HomescreenDeliveryContainer(w_mdof),
                ],
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

Container HomescreenNoticeContainer(double w_mdof) {
  return Container(
    width: w_mdof,
    height: 60.0,
    decoration: BoxDecoration(
      color: Color(0xffffc2bd),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Color(0xfff7a199), width: 0.1),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '  🚨 공지: ####### 🚨',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ],
    ),
  );
}

Container HomescreenBathContainer(double w_mdof) {
  return Container(
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
  );
}

Container HomescreenDeliveryContainer(double w_mdof) {
  return Container(
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
  );
}
