class Bonus_Record_Controller {
  String? id;
  String? userId;
  String? code;
  String? status;
  String? created_at;
  String? updated_at;
  String? amount;



  Bonus_Record_Controller({
    required this.id,
    required this.userId,
    required this.code,
    required this.status,
    required this.created_at,
    required this.updated_at,
    required this.amount,


  });
  factory Bonus_Record_Controller.fromJson(Map<String, dynamic> json) {
    return Bonus_Record_Controller(
      id: json["id"],
      userId: json["userId"],
      code: json["code"],
      status: json["status"],
      created_at: json["created_at"],
      updated_at: json["updated_at"],
      amount: json["amount"],

    );
  }


}