import 'package:flutter/material.dart';
import 'package:nambu_admin/model/categorymodel.dart';

Future<void> showCategoryModal({
  required BuildContext context,
  required List<CategoryModel> categoryList,
  required Function(int) onCategorySelected,
}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return CategorySelectModalDesign(
        categoryList: categoryList,
        onCategorySelected: onCategorySelected,
      );
    },
  );
}

class CategorySelectModalDesign extends StatelessWidget {
  final List<CategoryModel> categoryList;
  final Function(int) onCategorySelected;

  const CategorySelectModalDesign(
      {required this.categoryList,
      required this.onCategorySelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ), // 모달 움직임 시각 컨테이너
          const SizedBox(height: 10),
          const Text('카테고리 선택',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              )), // 카테고리 선택 텍스트
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                child: InkWell(
                  onTap: () {
                    onCategorySelected(index);
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(categoryList[index].iconData),
                          const SizedBox(width: 20.0),
                          Text(
                            categoryList[index].title,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
