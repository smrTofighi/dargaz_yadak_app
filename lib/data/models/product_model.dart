import 'package:car_soare_parts_app/data/models/category_model.dart';

class ProductModel {
  int? id;
  String? title;
  String? slug;
  String? price;
  String? productCategoriesId;
  String? discount;
  String? weight;
  String? brand;
  dynamic timeDelivery;
  String? userId;
  dynamic metaKeywords;
  dynamic metaDescription;
  dynamic fullDescription;
  String? status;
  String? comment;
  dynamic abstractDescription;
  String? minOrder;
  String? maxOrder;
  String? quantity;
  String? shippingCost;
  String? hits;
  String? indexImage;
  String? tax;
  String? brandId;
  List<dynamic>? properties;
  List<dynamic>? attachedProducts;
  CategoryModel? category;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.productCategoriesId,
    this.discount,
    this.weight,
    this.brand,
    this.timeDelivery,
    this.userId,
    this.metaKeywords,
    this.metaDescription,
    this.fullDescription,
    this.status,
    this.comment,
    this.abstractDescription,
    this.minOrder,
    this.maxOrder,
    this.quantity,
    this.shippingCost,
    this.hits,
    this.indexImage,
    this.tax,
    this.brandId,
    this.properties,
    this.attachedProducts,
    this.category,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    slug = json["slug"];
    price = json["price"];
    productCategoriesId = json["product_categories_id"];
    discount = json["discount"];
    weight = json["weight"];
    brand = json["brand"];
    timeDelivery = json["time_delivery"];
    userId = json["user_id"];
    metaKeywords = json["meta_keywords"];
    metaDescription = json["meta_description"];
    fullDescription = json["full_description"];
    status = json["status"];
    comment = json["comment"];
    abstractDescription = json["abstract_description"];
    minOrder = json["min_order"];
    maxOrder = json["max_order"];
    quantity = json["quantity"];
    shippingCost = json["shipping_cost"];
    hits = json["hits"];
    indexImage = json["index_image"];
    tax = json["tax"];
    brandId = json["brand_id"];
    properties = json["properties"] ?? [];
    attachedProducts = json["attached_products"] ?? [];
    //category = json['category'];
  }
}
