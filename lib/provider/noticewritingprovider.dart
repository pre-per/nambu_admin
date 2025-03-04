import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nambu_admin/model/noticemodel.dart';

class NoticeProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  NoticeModel _notice = NoticeModel();

  NoticeModel get notice => _notice;

  DateTime get dateTime => _notice.dateTime;

  Future<void> pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _notice.dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_notice.dateTime),
    );

    if (pickedTime == null) return;

    _notice.dateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    notifyListeners();
  }

  void saveNotice() {
    _notice = NoticeModel(
      title: titleController.text,
      dateTime: _notice.dateTime,
      description: descriptionController.text,
    );
    notifyListeners();
    print("저장된 공지: ${_notice.title}, ${_notice.dateTime}, ${_notice.description}");
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
