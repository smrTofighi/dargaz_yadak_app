class OrderModel {
  int? id;
  String? userId;
  String? deliveryName;
  String? deliveryAddress;
  String? deliveryPostalCode;
  String? deliveryMobile;
  String? deliveryNationalCode;
  String? deliveryEmail;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? orderType;
  String? deliveryProvince;
  String? deliverySendType;
  String? orderSubject;

  OrderModel();
  // Constructor
  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deliveryName = json['delivery_name'];
    deliveryAddress = json['delivery_address'];
    deliveryPostalCode = json['delivery_postal_code'];
    deliveryMobile = json['delivery_mobile'];
    deliveryNationalCode = json['delivery_national_code'];
    deliveryEmail = json['delivery_email'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    orderType = json['order_type'];
    deliveryProvince = json['delivery_province'];
    deliverySendType = json['delivery_send_type'];
    orderSubject = json['order_subject'];
  }
}
