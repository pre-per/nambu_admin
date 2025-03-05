import 'package:flutter/material.dart';
import 'package:nambu_admin/provider/calendaraddplanprovider.dart';
import 'package:provider/provider.dart';

Future<dynamic> showCategoryselectModal(BuildContext context) {
  final provider = Provider.of<Calendaraddplanprovider>(context, listen: false);

  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
    builder: (BuildContext context) {
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
            ),
            const SizedBox(height: 10),
            const Text('카테고리 선택', style: TextStyle(fontSize: 17.0)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.category.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: InkWell(
                    onTap: () {
                      provider.selectedCategory;
                    },
                    child: Ink(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 60.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(provider.category[index].iconData),
                            const SizedBox(width: 20.0),
                            Text(
                              provider.category[index].title,
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
    },
  );
}
