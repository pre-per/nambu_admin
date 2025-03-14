import 'package:flutter/material.dart';
import 'package:nambu_admin/main.dart';
import 'package:nambu_admin/model/sportpersonmodel.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Sportpersonalcard extends StatelessWidget {
  final Sportpersonmodel person;

  Sportpersonalcard({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SportpersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, setState) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.grey, width: 0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 30.0, right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${person.name}님',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w600,
                                    )),
                                person.isChecked
                                    ? Expanded(
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 5.0),
                                            Image.asset('asset/image/check.png',
                                                height: 30.0, width: 30.0),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                Container(
                                  width: 80.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: person.isBlueTeam
                                        ? Color(0xFFD0E8F2)
                                        : Color(0xFFF4C2C2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      person.isBlueTeam ? '청팀' : '홍팀',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            GestureDetector(
                              onTap: () {
                                if (person.phoneNum.contains('전화번호')) {
                                  print("Incorrect phoneNum");
                                } else {
                                  launchUrlString('tel://${person.phoneNum}');
                                  print("Call");
                                }
                              },
                              child: IntrinsicWidth(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Text(person.phoneNum,
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[600],
                                          )),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 22.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child:
                                        Icon(Icons.accessibility, size: 25.0),
                                  ),
                                ),
                                const SizedBox(width: 25.0),
                                Expanded(
                                    child: Text(
                                  '성인의 수',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )),
                                Text(
                                  '${person.adultNum}명',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.face, size: 25.0),
                                  ),
                                ),
                                const SizedBox(width: 25.0),
                                Expanded(
                                    child: Text(
                                  '어린이의 수',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )),
                                Text(
                                  '${person.childNum}명',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                                width: double.infinity,
                                child: Divider(
                                    color: Colors.grey[300], height: 0.05)),
                            const SizedBox(height: 20.0),
                            GestureDetector(
                              onTap: () {
                                provider.toggleCheck(person);
                                setState(() {});
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 30.0,
                                child: Center(
                                  child: Text(
                                    person.isChecked ? '출석 취소하기' : '출석하기',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red[700]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                });
              });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70.0,
          decoration: BoxDecoration(
            color: person.isBlueTeam ? Color(0xFFD0E8F2) : Color(0xFFF4C2C2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 15.0),
                Text(person.num.toString(),
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                const SizedBox(width: 25.0),
                Expanded(
                    child: Text(person.name,
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.w600))),
                person.isChecked
                    ? Image.asset('asset/image/check.png',
                        height: 25.0, width: 25.0)
                    : SizedBox(),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
