import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String date;

  const NoticeCard(
      {required this.title, required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                      title,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    Text(
                      date,
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
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[600]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}