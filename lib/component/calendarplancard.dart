import 'package:flutter/material.dart';
import 'package:nambu_admin/screen/sub/calendarcarddetails.dart';

class Calendarplancard extends StatefulWidget {
  IconData? iconData;
  String title;
  Color backgroundColor;

  Calendarplancard({
    this.iconData,
    this.title = 'Empty Title',
    this.backgroundColor = Colors.white,
    super.key,
  });

  @override
  State<Calendarplancard> createState() => _NoticecardState();
}

class _NoticecardState extends State<Calendarplancard> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.98;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.00;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 10.0, right: 10.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_scale),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Calendarcarddetails()));
              },
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              onTapCancel: _onTapCancel,
              child: Ink(
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey, width: 0.1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '11:00',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200],
                          ),
                          child: Center(
                            child: Icon(
                              (widget.iconData != null)
                                  ? widget.iconData
                                  : Icons.hourglass_empty,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
