class HomeWidetModel {
  int? id;
  String? title;
  String? description;
  String? contentType;
  String? styleNumber;
  dynamic divBackgroundColor;

  String? status;

  HomeWidetModel(
      {this.id,
      this.title,
      this.description,
      this.contentType,
      this.styleNumber,
      this.divBackgroundColor,
      this.status});

  HomeWidetModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["content_type"] is String) {
      contentType = json["content_type"];
    }
    if (json["style_number"] is String) {
      styleNumber = json["style_number"];
    }
    divBackgroundColor = json["div_background_color"];

    if (json["status"] is String) {
      status = json["status"];
    }
  }
}
