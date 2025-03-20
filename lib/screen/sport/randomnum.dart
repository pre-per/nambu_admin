import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nambu_admin/component/bottomBarDesign.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/provider/sport/randomnumprovider.dart';
import 'package:provider/provider.dart';

class Randomnum extends StatelessWidget {
  const Randomnum({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final provider = Provider.of<RandomnumProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            provider.drawNum();
            provider.startConfetti();
          },
          child: BottomBarDesign(text: '랜덤 숫자뽑기', color: MAIN_YELLOW_COLOR),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('최대 숫자: ${provider.maxNum}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)), // 텍스트 '최대 숫자: xx'
            const SizedBox(height: 20.0),
            SizedBox(
              height: 80, // 높이 조절
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal, // 가로 스크롤
                  itemCount: 50, // 1~50까지 숫자 표시
                  itemBuilder: (context, index) {
                    int number = index + 1;
                    bool isSelected = provider.maxNum == number;
                    return GestureDetector(
                      onTap: () {
                        provider.setMaxNum(index + 1);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Color(0xFFFFECB3) : Colors.grey[200],
                          // 기본 배경색
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '$number',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ), // 화면 상단 스크롤바
            const SizedBox(height: 100.0),
            Text(
              '뽑힌 숫자',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ), // 텍스트 '뽑힌 숫자'
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 200),
              tween: Tween<double>(
                begin: provider.isAnimating ? 40.0 : 35.0,
                end: provider.isAnimating ? 35.0 : 40.0,
              ),
              builder: (context, size, child) {
                return Text(
                  provider.randomBool ? '청팀' : '홍팀',
                  style: TextStyle(
                      color: provider.randomBool ? Colors.blue : Colors.red,
                      fontSize: size,
                      fontWeight: FontWeight.w600),
                );
              },
            ), // 팀 랜덤 뽑기
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 200),
              tween: Tween<double>(
                begin: provider.isAnimating ? 60.0 : 50.0,
                end: provider.isAnimating ? 50.0 : 60.0,
              ),
              builder: (context, size, child) {
                return Text(
                  '${provider.drawedNum}번',
                  style: TextStyle(fontSize: size, fontWeight: FontWeight.w600),
                );
              },
            ), // 숫자 랜덤 뽑기
            provider.showConfetti
                ? Positioned.fill(
                    child: Center(
                      child: Lottie.asset(
                        'asset/animation/congratulations.json',
                        width: 300,
                        height: 300,
                        repeat: false,
                      ),
                    ),
                  )
                : const SizedBox.shrink(), // 뽑을 때 애니메이션
          ],
        ),
      ),
    );
  }
}
