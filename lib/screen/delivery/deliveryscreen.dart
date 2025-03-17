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
    scrolledUnderElevation: 0,
    title: Text('도시락 배달',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        )),
  );
}
