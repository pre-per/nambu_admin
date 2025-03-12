import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nambu_admin/provider/randomnumprovider.dart';
import 'package:provider/provider.dart';

class Randomnum extends StatelessWidget {
  const Randomnum({super.key});

  @override
  Widget build(BuildContext context) {
    final double w_mdof = MediaQuery.of(context).size.width;
    final ScrollController _scrollController = ScrollController();
    final provider = Provider.of<RandomnumProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(scrolledUnderElevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('최대 숫자: ${provider.maxNum}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 80, // 높이 조절
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal, // 가로 스크롤
                  itemCount: 50, // 1~100까지 숫자 표시
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
            ),
            const SizedBox(height: 100.0),
            Text(
              '뽑힌 숫자',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            Text(
              provider.randomBool ? '청팀' : '홍팀',
              style: TextStyle(
                  color: provider.randomBool
                      ? Colors.blue
                      : Colors.red,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '${provider.drawedNum}번',
              style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.w600),
            ),
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
                : const SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            provider.drawNum();
            provider.startConfetti();
          },
          child: Ink(
            width: w_mdof,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFFFFECB3),
            ),
            child: Center(
              child: Text('랜덤 숫자뽑기',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ),
    );
  }
}
