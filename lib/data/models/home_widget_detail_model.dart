class HomeWidgetDetailModel {
  String? title;
  String? slug;
  String? price;
  String? discount;
  String? abstractDescription;
  int? id;
  String? path;

  HomeWidgetDetailModel({
    this.title,
    this.slug,
    this.price,
    this.discount,
    this.abstractDescription,
    this.id,
    this.path,
  });

  HomeWidgetDetailModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    slug = json["slug"];
    price = json["price"];
    discount = json["discount"];
    abstractDescription = json["abstract_description"];
    id = json["id"];
    path = 'https://dargaz-yadak.ir/${json["path"]}';
  }
}
