import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nambu_admin/provider/calendar/calendaraddplanprovider.dart';

class CalendarAddplan extends StatelessWidget {
  const CalendarAddplan({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;
    final provider =
        Provider.of<Calendaraddplanprovider>(context, listen: false);

    return Scaffold(
      appBar: CalendarAddplanAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                  },
                  child: SizedBox(
                    child: Text('click'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CalendarAddplanBottomAppBar(w_mdof, context),
    );
  }
}

AppBar CalendarAddplanAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      '일정 추가하기',
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

BottomAppBar CalendarAddplanBottomAppBar(double w_mdof, BuildContext context) {
  return BottomAppBar(
    color: Colors.white,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: w_mdof * 0.6,
        decoration: BoxDecoration(
          color: Color(0xfffc7168),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text('작성 완료',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
        ),
      ),
    ),
  );
}
