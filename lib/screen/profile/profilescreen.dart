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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ProfilescreenProfileContainer(w_mdof),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AppBar ProfilescreenAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    centerTitle: false,
    title: Text(
      ' 👏🏻 안녕하세요, 남부종합사회복지관님',
      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
    ),
  );
}

Container ProfilescreenProfileContainer(double w_mdof) {
  return Container(
    width: w_mdof,
    height: 100.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Icon(
              Icons.face,
              size: 30.0,
            ),
            const SizedBox(width: 30),
            Text(
              '남부종합사회복지관님',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}
