import 'package:flutter/material.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/provider/sport/sportpersonprovider.dart';
import 'package:nambu_admin/screen/sport/addPerson.dart';
import 'package:nambu_admin/screen/sport/randomnum.dart';
import 'package:nambu_admin/screen/sport/teamview.dart';
import 'package:nambu_admin/component/sport/sportsearchdelegate.dart';
import 'package:provider/provider.dart';

class Sportscreen extends StatelessWidget {
  const Sportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  // 검색창
                  const SizedBox(height: 30.0),
                  SportscreenTeamScore(),
                  // 팀 스코어 표시
                  const SizedBox(height: 20.0),
                  Text('부가기능',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  // Text '부가기능'
                  const SizedBox(height: 20.0),
                  SportscreenSubFeatureInkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Randomnum()));
                      },
                      title: '랜덤 숫자뽑기',
                      iconData: Icons.card_giftcard), // 랜덤 숫자 뽑기
                  const SizedBox(height: 10.0),
                  SportscreenSubFeatureInkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SportAddPerson()));
                      },
                      title: '참여자 추가하기',
                      iconData: Icons.add_reaction_outlined), // 참여자 추가하기
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar SportscreenAppBar() {
  return AppBar(
    title: Text('봄 운동회',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
        )),
  );
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

class SportscreenTeamScore extends StatelessWidget {
  const SportscreenTeamScore({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' 청팀',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
              TeamScore(context, true),
              const SizedBox(height: 10.0),
              SportscreenGetMore(
                  context, MediaQuery.of(context).size.width, true),
              const SizedBox(height: 10.0),
            ],
          ),
          VerticalDivider(color: Colors.grey[300], width: 0.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' 홍팀',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
              TeamScore(context, false),
              const SizedBox(height: 10.0),
              SportscreenGetMore(
                  context, MediaQuery.of(context).size.width, false),
              const SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}

Row TeamScore(BuildContext context, bool isBlue) {
  final provider = Provider.of<SportpersonProvider>(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          provider.addScore(false, isBlue);
        },
        icon: Icon(Icons.remove),
      ),
      IntrinsicWidth(
        child: Text(
          '${(isBlue ? provider.blueScore : provider.redScore).toString().padLeft(3, ' ')}점',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
      ),
      IconButton(
        onPressed: () {
          provider.addScore(true, isBlue);
        },
        icon: Icon(Icons.add),
      ),
    ],
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
      height: 50.0,
      decoration: BoxDecoration(
        color: isBlueTeam ? BLUE_TEAM_COLOR : RED_TEAM_COLOR,
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

class SportscreenSubFeatureInkWell extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData iconData;

  const SportscreenSubFeatureInkWell(
      {required this.onTap,
      required this.title,
      required this.iconData,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: MAIN_YELLOW_COLOR,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(iconData),
              const SizedBox(width: 20.0),
              Expanded(
                  child: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              )),
              Icon(Icons.navigate_next, color: Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }
}
