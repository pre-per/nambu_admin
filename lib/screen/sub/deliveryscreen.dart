import 'package:flutter/material.dart';

class Deliveryscreen extends StatelessWidget {
  const Deliveryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryscreenAppBar(),
    );
  }
}

AppBar DeliveryscreenAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text('도시락 배달',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        )),
  );
}
