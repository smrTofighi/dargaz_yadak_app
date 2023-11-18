class CategoryModel {
  int? id;
  String? title;
  String? slug;
  dynamic parentId;
  dynamic description;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? status;
  dynamic icon;
  List<dynamic>? childs;

  CategoryModel(
      {this.id,
      this.title,
      this.slug,
      this.parentId,
      this.description,
      this.metaKeywords,
      this.metaDescription,
      this.status,
      this.icon,
      this.childs});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    parentId = json["parent_id"];
    description = json["description"];
    metaKeywords = json["meta_keywords"];
    metaDescription = json["meta_description"];

    if (json["status"] is String) {
      status = json["status"];
    }
    icon = json["icon"];
    if (json["childs"] is List) {
      childs = json["childs"] ?? [];
    }
  }
}
