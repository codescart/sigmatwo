import 'package:flutter/material.dart';

class myprojectcontroller {
  String? id;
  String? name;
  String? price;
  String? image;
  String? type;
  String? status;
  String? slug;
  String? discount;
  String? description;
  String? productValidity;
  String? productComm;
  String? totalIncome;
  String? createdAt;
  String?updatedAt;
  String? userId;
  String? productId;
  String? purchaseAmount;
  String? purchaseDate;
  String? purchaseExpdate;
  String? timeremaining;


  myprojectcontroller({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.type,
    required this.status,
    required this.slug,
    required this.discount,
    required this.description,
    required this.productValidity,
    required this.productComm,
    required this.totalIncome,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.productId,
    required this.purchaseAmount,
    required this.purchaseDate,
    required this.purchaseExpdate,
    required this.timeremaining,

  });
  factory myprojectcontroller.fromJson(Map<String, dynamic> json) {
    return myprojectcontroller(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      type: json["type"],
      status: json["status"],
      slug: json["slug"],
      discount: json["discount"],
      description: json["description"],
      productValidity: json["product_validity"],
      productComm: json["product_comm"],
      totalIncome: json["total_income"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      userId: json["user_id"],
      productId: json["product_id"],
      purchaseAmount: json["purchase_amount"],
      purchaseDate: json["purchase_date"],
      purchaseExpdate: json["purchase_expdate"],
      timeremaining: json["timeremaining"],
    );
  }


}