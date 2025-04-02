import 'package:flutter/material.dart';
import 'package:nambu_admin/component/bath/remainder_num_widget.dart';

class Bathscreen extends StatelessWidget {
  const Bathscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BathscreenAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            RemainderNumWidget(category: 'total'),
            RemainderNumWidget(category: 'men'),
            RemainderNumWidget(category: 'women'),
            RemainderNumWidget(category: 'office'),
          ],
        ),
      ),
    );
  }
}

AppBar BathscreenAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    title: Text('목욕탕',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        )),
  );
}
