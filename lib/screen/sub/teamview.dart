import 'package:flutter/material.dart';
import 'package:nambu_admin/component/sportpersonalcard.dart';

class Teamview extends StatelessWidget {
  final String teamText;

  const Teamview({required this.teamText, super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TeamviewAppBar(teamText),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                Sportpersonalcard(w_mdof: w_mdof, color: Color(0xFFD0E8F2)),
                const SizedBox(height: 8.0),
                const SizedBox(height: 20.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}

AppBar TeamviewAppBar(String teamText) {
  return AppBar(
    title: Text(
      teamText,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    ),
    scrolledUnderElevation: 0,
  );
}
