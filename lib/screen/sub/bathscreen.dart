import 'package:flutter/material.dart';

class Bathscreen extends StatelessWidget {
  const Bathscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BathscreenAppBar(),
    );
  }
}

AppBar BathscreenAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text('목욕탕',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        )),
  );
}
