class Sportpersonmodel {
  String name;
  String phoneNum;
  int num;
  int adultNum;
  int childNum;
  bool isChecked;
  bool isBlueTeam;


  Sportpersonmodel({
    this.name = '',
    this.num = -1,
    this.adultNum = -1,
    this.childNum = -1,
    this.isChecked = false,
    this.isBlueTeam = true,
    this.phoneNum = '전화번호 기록 없음',
  });
}
