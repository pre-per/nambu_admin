import 'package:flutter/material.dart';

class Calendarscreen extends StatelessWidget {
  const Calendarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CalendarscreenAppBar(),
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

AppBar CalendarscreenAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(' 📆 일정을 확인하세요',
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black)),
    centerTitle: false,
  );
}

Container CalendarscreenCalendar(double w_mdof) {
  return Container(
    width: w_mdof,
    height: 400.0,
    color: Colors.green[400],
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
