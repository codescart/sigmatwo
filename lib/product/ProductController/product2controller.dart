
class Product2Controller {
  String? id;
  String? name;
  String? price;
  String? image;
  String? status;
  String? slug;
  String? discount;
  String? description;
  String? productValidity;
  String? productComm;
  String? createdAt;
  String? updatedAt;
  String? total_income;
  String? Purchasestatus;


  Product2Controller({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.status,
    required this.slug,
    required this.discount,
    required this.description,
    required this.productValidity,
    required this.productComm,
    required this.createdAt,
    required this.updatedAt,
    required this.total_income,
    required this.Purchasestatus,
  });
  factory Product2Controller.fromJson(Map<String, dynamic> json) {
    return Product2Controller(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      status: json["status"],
      slug: json["slug"],
      discount: json["discount"],
      description: json["description"],
      productValidity: json["product_validity"],
      productComm: json["product_comm"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      total_income: json["total_income"],
      Purchasestatus: json["Purchasestatus"],
    );
  }


}