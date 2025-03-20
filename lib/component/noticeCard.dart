import 'package:flutter/material.dart';
import 'package:nambu_admin/model/noticemodel.dart';
import 'package:nambu_admin/screen/home/notice/noticedetails.dart';

class NoticeCard extends StatelessWidget {
  final NoticeModel notice;

  const NoticeCard({required this.notice, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => NoticeDetails(notice: notice)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notice.title,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      notice.dateTime,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '>',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey[400]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
