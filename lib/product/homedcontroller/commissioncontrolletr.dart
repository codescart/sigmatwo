class Commission_controller {
  String? id;
  String? account;
  String? level;
  String? reedemDate;
  String? commAmount;
  String? userid;
  String? myid;
  String? levelCommtype;
  String? createdAt;
  String? updatedAt;


  Commission_controller({
    required this.id,
    required this.account,
    required this.level,
    required this.reedemDate,
    required this.commAmount,
    required this.userid,
    required this.myid,
    required this.levelCommtype,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Commission_controller.fromJson(Map<String, dynamic> json) {
    return Commission_controller(
      id: json["id"],
      account: json["account"],
      level: json["level"],
      reedemDate: json["reedem_date"],
      commAmount: json["comm_amount"],
      userid: json["userid"],
      myid: json["myid"],
      levelCommtype: json["level_commtype"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }


}