class OrderProductModel {
  int? id;
  String? orderId;
  String? productId;
  String? productName;
  String? productQuantity;
  String? productPrice;
  String? productDiscount;
  String? productShippingCost;
  String? productTax;

  // Constructor
  OrderProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productQuantity = json['product_quantity'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productShippingCost = json['product_shipping_cost'];
    productTax = json['product_tax'];
  }
}
