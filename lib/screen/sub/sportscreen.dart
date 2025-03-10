import 'package:flutter/material.dart';
import 'package:nambu_admin/component/sportpersonalcard.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:nambu_admin/screen/sub/teamview.dart';
import 'package:provider/provider.dart';

class Sportscreen extends StatelessWidget {
  const Sportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SportscreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                SportscreenSearchBar(w_mdof),
                const SizedBox(height: 30.0),
                Text('청팀',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                const SizedBox(height: 20.0),
                Consumer<SportpersonProvider>(
                  builder: (context, provider, child) {
                    provider.switchTeam(true);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Sportpersonalcard(index: index);
                      },
                    );
                  },
                ),
                SportscreenGetMore(context, w_mdof, Color(0xFFD4EAC7), true),
                const SizedBox(height: 8.0),
                const SizedBox(height: 20.0),
                Text('홍팀',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                const SizedBox(height: 20.0),
                Consumer<SportpersonProvider>(
                  builder: (context, provider, child) {
                    provider.switchTeam(false);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Sportpersonalcard(index: index);
                      },
                    );
                  },
                ),
                SportscreenGetMore(context, w_mdof, Color(0xFFD4EAC7), false),
                const SizedBox(height: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

AppBar SportscreenAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    title: Text('봄 운동회',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        )),
  );
}

GestureDetector SportscreenSearchBar(double w_mdof) {
  return GestureDetector(
    onTap: () {
      print("검색어를 클릭해주세요 clicked");
    },
    child: Container(
      width: w_mdof,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 25.0, color: Colors.grey[600]),
            const SizedBox(width: 15.0),
            Text(
              '검색어를 입력해주세요',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

GestureDetector SportscreenGetMore(
    BuildContext context, double w_mdof, Color color, bool isBlueTeam) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => Teamview(isBlueTeam: isBlueTeam)));
    },
    child: Container(
      width: w_mdof,
      height: 50.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 15.0),
            Expanded(
                child: Text('${isBlueTeam ? '청팀' : '홍팀'} 전체보기',
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600))),
            Icon(Icons.navigate_next, size: 25.0, color: Colors.grey),
            const SizedBox(width: 10.0),
          ],
        ),
      ),
    ),
  );
}
