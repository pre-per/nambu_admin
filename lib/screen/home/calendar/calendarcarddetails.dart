import 'package:flutter/material.dart';

class Calendarcarddetails extends StatelessWidget {
  const Calendarcarddetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarcarddetailsAppBar(),
    );
  }
}

AppBar CalendarcarddetailsAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
  );
}