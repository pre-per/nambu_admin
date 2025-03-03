import 'package:flutter/material.dart';
import 'package:nambu_admin/screen/sub/calendaraddplan.dart';

class Calendarscreen extends StatelessWidget {
  const Calendarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CalendarscreenAppBar(context),
      body: ListView(
        children: [
          Column(
            children: [
              CalendarscreenCalendar(w_mdof),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar CalendarscreenAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(' 📆 일정을 확인하세요',
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CalendarAddplan()),
            );
          },
          child: Container(
            width: 100.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Color(0xffffc2bd),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Center(
              child: Text('일정 추가하기',
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

Container CalendarscreenCalendar(double w_mdof) {
  return Container(
    width: w_mdof,
    height: 400.0,
    color: Colors.green[300],
  );
}

Padding CalendarscreenCard(int num) {
  return Padding(
    padding: EdgeInsets.only(top: 7.0, left: 15.0, right: 15.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (_) {}),
          Text(
            '할 일 #$num',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
        ],
      ),
    ),
  );
}
