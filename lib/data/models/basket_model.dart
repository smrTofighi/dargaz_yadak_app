class BasketModel {
  String? count;
  String? price;
  String? productId;
  String? title;
  String? weight;

  BasketModel();

  BasketModel.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    price = json["price"];
    productId = json["product_id"];
    title = json["title"];
    weight = json["weight"];
  }
}
