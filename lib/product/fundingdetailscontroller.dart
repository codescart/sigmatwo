class Funding_Details_Controller {
  String? id;
  String? userid;
  String? amount;
  String? type;
  String? userwallet;
  String? createdAt;
  String? updatedAt;


  Funding_Details_Controller({
    required this.id,
    required this.userid,
    required this.amount,
    required this.type,
    required this.userwallet,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Funding_Details_Controller.fromJson(Map<String, dynamic> json) {
    return Funding_Details_Controller(
      id: json["id"],
      userid: json["userid"],
      amount: json["amount"],
      type: json["type"],
      userwallet: json["userwallet"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }


}