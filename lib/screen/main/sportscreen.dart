import 'package:flutter/material.dart';
import 'package:nambu_admin/component/sport/sportpersonalcard.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:nambu_admin/screen/sub/sport/randomnum.dart';
import 'package:nambu_admin/screen/sub/sport/teamview.dart';
import 'package:nambu_admin/component/sport/sportsearchdelegate.dart';
import 'package:provider/provider.dart';

class Sportscreen extends StatelessWidget {
  const Sportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  SportscreenSearchBar(context),
                  const SizedBox(height: 30.0),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' 청팀',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20.0),
                            SportscreenGetMore(context, w_mdof, true),
                          ],
                        ),
                        VerticalDivider(color: Colors.grey[300], width: 0.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' 홍팀',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20.0),
                            SportscreenGetMore(context, w_mdof, false),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text('부가기능',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20.0),
                  SportscreenRandomNum(context),
                  const SizedBox(height: 20.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

GestureDetector SportscreenSearchBar(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showSearch(context: context, delegate: SportSearchDelegate());
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(color: Colors.grey, width: 0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              const SizedBox(width: 5.0),
              Icon(Icons.search),
              const SizedBox(width: 5.0),
              VerticalDivider(),
              const SizedBox(width: 5.0),
              Text(
                '검색어를 입력하세요',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

AppBar SportscreenAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    title: Text('봄 운동회',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        )),
  );
}

GestureDetector SportscreenGetMore(
    BuildContext context, double w_mdof, bool isBlueTeam) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => Teamview(isBlueTeam: isBlueTeam)));
    },
    child: Container(
      width: w_mdof * 0.4,
      height: 80.0,
      decoration: BoxDecoration(
        color: isBlueTeam ? Color(0xFFD0E8F2) : Color(0xFFF4C2C2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('인원 확인하기',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            Icon(Icons.navigate_next, size: 25.0, color: Colors.grey),
          ],
        ),
      ),
    ),
  );
}

GestureDetector SportscreenRandomNum(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Randomnum()));
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xFFFFECB3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.card_giftcard),
            const SizedBox(width: 20.0),
            Expanded(
                child: Text(
              '랜덤 숫자뽑기',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            )),
            Icon(Icons.navigate_next, color: Colors.grey[600]),
          ],
        ),
      ),
    ),
  );
}
