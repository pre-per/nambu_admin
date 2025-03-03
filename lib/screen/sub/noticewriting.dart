import 'package:flutter/material.dart';

class Noticewriting extends StatelessWidget {
  const Noticewriting({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(children: [
        Column(
          children: [],
        )
      ]),
      bottomNavigationBar: NoticewritingBottomAppBar(w_mdof, context),
    );
  }
}

BottomAppBar NoticewritingBottomAppBar(double w_mdof, BuildContext context) {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: w_mdof * 0.3,
            color: Colors.transparent,
            child: Center(
              child: Text('취소',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: w_mdof * 0.6,
            decoration: BoxDecoration(
              color: Color(0xffffc2bd),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text('공지 작성하기',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
      ],
    ),
  );
}
