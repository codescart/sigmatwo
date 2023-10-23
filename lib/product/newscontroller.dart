class newscontroller {
  String? id;
  String? title;
  String? name;
  String? image;
  dynamic url;
  String? date;
  String? time;
  String? status;


  newscontroller({
     this.id,
     this.title,
     this.name,
     this.image,
     this.url,
     this.date,
     this.time,
     this.status,
  });
  factory newscontroller.fromJson(Map<String, dynamic> json) {
    return newscontroller(
      id: json["id"],
      title: json["title"],
      name: json["name"],
      image: json["image"],
      url: json["url"],
      date: json["date"],
      time: json["time"],
      status: json["status"],
    );
  }


}