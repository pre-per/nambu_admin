import 'package:flutter/material.dart';
import 'package:nambu_admin/component/sport/sportpersonalcard.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:provider/provider.dart';

class Teamview extends StatelessWidget {
  final bool isBlueTeam;

  const Teamview({required this.isBlueTeam, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SportpersonProvider>(context);
    provider.switchTeam(isBlueTeam);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(scrolledUnderElevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Text('  ${isBlueTeam ? '청팀' : '홍팀'}',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10.0),
            Text('  총 참석 인원: ${isBlueTeam ? provider.blueCheckedCount : provider.redCheckedCount}명',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600, color: Colors.grey[600])),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                  itemCount: provider.list.length,
                  itemBuilder: (context, index) {
                    return Sportpersonalcard(index: index);
                  }),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}