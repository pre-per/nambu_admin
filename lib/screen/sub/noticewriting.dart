import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/provider/noticewritingprovider.dart';
import 'package:provider/provider.dart';

class Noticewriting extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Noticewriting({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoticeProvider>(context);
    final double w_mdof = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        provider.saveNotice();
      },
      child: Scaffold(
        appBar: NoticewritingAppBar(),
        backgroundColor: Colors.white,
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('제목',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: provider.titleController,
                    decoration: InputDecoration(
                      hintText: '제목',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MAIN_RED_COLOR,
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
                  ),
                  const SizedBox(height: 40.0),
                  Text('카테고리',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 20.0),
                  
                  const SizedBox(height: 40.0),
                  Text('자세한 설명',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 200.0,
                    child: TextFormField(
                      controller: provider.descriptionController,
                      expands: true,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: '자세한 설명',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MAIN_RED_COLOR,
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
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar: NoticewritingBottomAppBar(w_mdof, context),
      ),
    );
  }
}

AppBar NoticewritingAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      '공지 작성하기',
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

BottomAppBar NoticewritingBottomAppBar(double w_mdof, BuildContext context) {
  return BottomAppBar(
    color: Colors.white,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: w_mdof,
        decoration: BoxDecoration(
          color: MAIN_RED_COLOR,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Center(
          child: Text('작성 완료',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
        ),
      ),
    ),
  );
}
