import 'package:car_soare_parts_app/core/utils/api_constant.dart';

class BrandModel {
  int? id;

  String? title;
  Image? image;

  BrandModel({this.id, this.title, this.image});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];

    title = json["title"];
    image = json["image"] == null ? Image(path: 'https://text.com/image.jpg') : Image.fromJson(json["image"]);
  }
}

class Image {
  int? id;
  String? name;
  String? mimeType;
  String? path;
  String? ownerType;
  String? ownerId;
  dynamic caption;

  Image(
      {this.id,
      this.name,
      this.mimeType,
      this.path,
      this.ownerType,
      this.ownerId,
      this.caption});

  Image.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    mimeType = json["mime_type"];
    path = ApiConstant.host + json["path"];
    ownerType = json["owner_type"];
    ownerId = json["owner_id"];

    caption = json["caption"];
  }
}
