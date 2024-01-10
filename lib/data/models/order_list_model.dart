class OrderListModel {
  int? id;
  String? status;
  String? createdAt;
  OrderListModel(this.id, this.status, this.createdAt);

  OrderListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
  }
}
