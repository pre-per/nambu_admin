import 'package:flutter/material.dart';

class CalendarAddplan extends StatelessWidget {
  const CalendarAddplan({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [

            ],
          )
        ],
      ),
      bottomNavigationBar: CalendarAddplanBottomAppBar(w_mdof, context),
    );
  }
}

BottomAppBar CalendarAddplanBottomAppBar(double w_mdof, BuildContext context) {
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
              child: Text('일정 추가하기',
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