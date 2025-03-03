import 'package:flutter/material.dart';
import 'package:nambu_admin/provider/calendarprovider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Calendarprovider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: TableCalendar(
        focusedDay: provider.focusedDay,
        firstDay: DateTime(2000, 1, 1),
        lastDay: DateTime(2100, 1, 1),
        currentDay: DateTime.now(),
        locale: 'ko_KR',
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        calendarStyle: CalendarStyle(
          defaultDecoration: BoxDecoration(
              shape: BoxShape.rectangle
          ),
          weekendDecoration: BoxDecoration(
              shape: BoxShape.rectangle
          ),
          todayTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.green[200],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.0),
          ),
          selectedTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          selectedDecoration: BoxDecoration(
            color: Color(0xffffc2bd),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          provider.updateSelectedDay(selectedDay);
        },
        selectedDayPredicate: (day) => isSameDay(provider.selectedDay, day),
      ),
    );
  }
}