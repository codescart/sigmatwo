class Invalid_My_TeamController {
  String? id;
  String? mobile;
  String? lavelStage;
  String? createdAt;


  Invalid_My_TeamController({
    required this.id,
    required this.mobile,
    required this.lavelStage,
    required this.createdAt,


  });
  factory Invalid_My_TeamController.fromJson(Map<String, dynamic> json) {
    return Invalid_My_TeamController(
      id: json["id"],
      mobile: json["mobile"],
      lavelStage: json["lavel_stage"],
      createdAt:json["created_at"],
    );
  }


}