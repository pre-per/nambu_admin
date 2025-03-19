import 'package:flutter/material.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';
import 'package:nambu_admin/provider/sport/sportAddPersonProvider.dart';
import 'package:nambu_admin/provider/sport/sportpersonprovider.dart';
import 'package:provider/provider.dart';

class SportAddPerson extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SportAddPerson({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SportAddPersonProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomAppBar(
          child: InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final Sportpersonmodel newTeam = provider.saveTeam();
                Provider.of<SportpersonProvider>(context, listen: false).addPerson(newTeam);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('인원이 추가되었습니다!'), behavior: SnackBarBehavior.floating,));
                Navigator.of(context).pop();
                provider.clearController();
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('형식을 다시 확인하세요'), behavior: SnackBarBehavior.floating,));
              }
            },
            child: Ink(
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFFFECB3),
              ),
              child: Center(
                child: Text('참여자 추가하기',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('이름',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: provider.nameController,
                      decoration: InputDecoration(
                        hintText: '대표자 성함',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MAIN_YELLOW_COLOR,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) return '대표자 이름을 입력하세요';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Text('전화번호',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: provider.phoneNumController,
                      decoration: InputDecoration(
                        hintText: '010xxxxxxxx 형식으로 입력해주세요',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MAIN_YELLOW_COLOR,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) return '전화번호를 입력하세요';
                        if (!RegExp(r'^010\d{8}$').hasMatch(value)) return '010xxxxxxxx 형식을 지켜주세요';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Text('고유번호',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: provider.numController,
                      decoration: InputDecoration(
                        hintText: '번호를 입력해주세요',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MAIN_YELLOW_COLOR,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) return '번호를 입력하세요';
                        if (int.tryParse(value) == null) return '숫자를 입력하세요';
                        return null;
                      },
                    ),
                    const SizedBox(height: 50.0),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '어른의 수',
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10.0),
                              addAdultChild(context, true),
                            ],
                          ),
                          VerticalDivider(),
                          Column(
                            children: [
                              Text(
                                '어린이의 수',
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10.0),
                              addAdultChild(context, false),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.setTeam(true);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: provider.isBlueTeam
                                    ? Color(0xFFD0E8FF)
                                    : Colors.grey[200]),
                            child: Center(
                              child: Text(
                                '청팀',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.setTeam(false);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: provider.isBlueTeam
                                    ? Colors.grey[200]
                                    : RED_TEAM_COLOR),
                            child: Center(
                              child: Text(
                                '홍팀',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row addAdultChild(BuildContext context, bool isAdult) {
  final provider = Provider.of<SportAddPersonProvider>(context);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          provider.addAdultChildNum(false, isAdult);
        },
        icon: Icon(Icons.remove),
      ),
      IntrinsicWidth(
        child: Text(
          '${isAdult ? provider.adultNum : provider.childNum}명',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
      ),
      IconButton(
        onPressed: () {
          provider.addAdultChildNum(true, isAdult);
        },
        icon: Icon(Icons.add),
      ),
    ],
  );
}
