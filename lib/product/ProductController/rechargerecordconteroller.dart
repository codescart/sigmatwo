class Recharge_Controlletr {
  String? id;
  String? userId;
  String? amount;
  String? type;
  String? addedDate;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? orderNumber;


  Recharge_Controlletr({
    required this.id,
    required this.userId,
    required this.amount,
    required this.type,
    required this.addedDate,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.orderNumber,
  });
  factory Recharge_Controlletr.fromJson(Map<String, dynamic> json) {
    return Recharge_Controlletr(
      id: json["id"],
      userId: json["user_id"],
      amount: json["amount"],
      type: json["type"],
      addedDate: json["added_date"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      status: json["status"],
      orderNumber: json["order_number"],
    );
  }


}