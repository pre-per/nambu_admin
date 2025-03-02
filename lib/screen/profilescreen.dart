import 'package:flutter/material.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ProfilescreenAppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              ProfilescreenProfileContainer(w_mdof),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar ProfilescreenAppBar() {
  return AppBar(
    centerTitle: false,
    title: Text(
      ' 👏🏻 안녕하세요, 남부종합사회복지관님',
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    ),
  );
}

Container ProfilescreenProfileContainer(double w_mdof) {
  return Container(
    width: w_mdof,
    height: 200.0,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.face,
            size: 40.0,
          ),
          Text(
            '남부종합사회복지관님',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
