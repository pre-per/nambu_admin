class NoticeModel {
  String title;
  DateTime dateTime;
  String description;

  NoticeModel({
    this.title = "",
    DateTime? dateTime,
    this.description = "",
  }) : dateTime = dateTime ?? DateTime.now();
}