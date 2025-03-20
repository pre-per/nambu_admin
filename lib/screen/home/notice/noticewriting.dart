import 'package:flutter/material.dart';
import 'package:nambu_admin/component/bottomBarDesign.dart';
import 'package:nambu_admin/component/showCategoryModal.dart';
import 'package:nambu_admin/component/textFormFieldWidget.dart';
import 'package:nambu_admin/const/colors.dart';
import 'package:nambu_admin/model/categorymodel.dart';
import 'package:nambu_admin/provider/notice/noticeProvider.dart';
import 'package:provider/provider.dart';

class Noticewriting extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Noticewriting({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoticeProvider>(context);
    final CategoryModel category = CategoryModel();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: NoticewritingAppBar(),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onTap: () {
              provider.saveNotice();
              Navigator.of(context).pop();
            },
            child: BottomBarDesign(text: '작성 완료', color: MAIN_YELLOW_COLOR),
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  TextFormFieldWidget(
                      textEditingController: provider.titleController,
                      mainText: '제목',
                      hintText: '제목을 작성해주세요',
                      validator: (String? value) {
                        if (value!.isEmpty) return '제목을 작성해주세요';
                        return null;
                      }),
                  const SizedBox(height: 20.0),
                  Text('자세한 설명',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 20.0),
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
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCategoryModal(
                              context: context,
                              categoryList: provider.noticeCategoryList,
                              onCategorySelected: (int index) {
                                provider.selectCategory(index);
                              });
                        },
                        child: Container(
                          width: 180.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: MAIN_YELLOW_COLOR,
                          ),
                          child: Center(
                            child: Text(
                              '카테고리 선택하기',
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        provider.selectedCategory.title,
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

AppBar NoticewritingAppBar() {
  return AppBar(
    title: Text(
      '공지 작성하기',
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
