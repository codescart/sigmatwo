class teamcommisioncontroller {
  String? id;
  String? lavelStage;
  String? commission;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? count;


  teamcommisioncontroller({
    required this.id,
    required this.lavelStage,
    required this.commission,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.count,
  });
  factory teamcommisioncontroller.fromJson(Map<String, dynamic> json) {
    return teamcommisioncontroller(
      id: json["id"],
      lavelStage: json["lavel_stage"],
      commission: json["commission"],
      createdAt:json["created_at"],
      updatedAt: json["updated_at"],
      status: json["status"],
      count: json["count"],
    );
  }


}