class ImageModel {
  int? id;
  String? name;
  String? mimeType;
  String? path;
  String? ownerType;
  String? ownerId;

  dynamic caption;

  ImageModel(
      {this.id,
      this.name,
      this.mimeType,
      this.path,
      this.ownerType,
      this.ownerId,
      this.caption});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    mimeType = json["mime_type"];
    path = 'https://dargaz-yadak.ir/${json["path"]}';
    ownerType = json["owner_type"];
    ownerId = json["owner_id"];

    caption = json["caption"];
  }
}
