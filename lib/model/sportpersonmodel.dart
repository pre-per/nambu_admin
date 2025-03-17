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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNum': phoneNum,
      'num': num,
      'adultNum': adultNum,
      'childNum': childNum,
      'isChecked': isChecked,
      'isBlueTeam': isBlueTeam,
    };
  }
  factory Sportpersonmodel.fromMap(Map<String, dynamic> map) {
    return Sportpersonmodel(
      name: map['name'] ?? 'Untitled',
      phoneNum: map['phoneNum'] ?? '전화번호 기록 없음',
      num: map['num'] ?? -1,
      adultNum: map['adultNum'] ?? -1,
      childNum: map['childNum'] ?? -1,
      isChecked: map['isChecked'] ?? false,
      isBlueTeam: map['isBlueTeam'] ?? true,
    );
  }
}
