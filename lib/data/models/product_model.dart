import 'dart:convert';

class ProductModel {
    int? id;
    String? title;
    String? slug;
    String? price;
    String? discount;
    String? weight;
    dynamic brand;
    dynamic timeDelivery;
    String? userId;
    String? metaKeywords;
    String? metaDescription;
    String? fullDescription;
    String? status;
    String? comment;
    String? abstractDescription;
    String? minOrder;
    String? maxOrder;
    String? quantity;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? shippingCost;
    String? hits;
    String? indexImage;
    String? tax;
    String? brandId;
    String? wholesalePrice;
    String? wholesaleCount;
    String? image;
    String? newPrice;
    dynamic oldPrice;

    ProductModel({
          this.id,
          this.title,
          this.slug,
          this.price,
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
          this.createdAt,
          this.updatedAt,
          this.shippingCost,
          this.hits,
          this.indexImage,
          this.tax,
          this.brandId,
          this.wholesalePrice,
          this.wholesaleCount,
          this.image,
          this.newPrice,
          this.oldPrice,
    });

    

   

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        discount: json["discount"],
        weight: json["weight"],
        brand: json["brand"] ?? '',
        timeDelivery: json["time_delivery"]?? '',
        userId: json["user_id"],
        metaKeywords: json["meta_keywords"]?? '',
        metaDescription: json["meta_description"]?? '',
        fullDescription: json["full_description"]?? '',
        status: json["status"],
        comment: json["comment"],
        abstractDescription: json["abstract_description"]?? '',
        minOrder: json["min_order"],
        maxOrder: json["max_order"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shippingCost: json["shipping_cost"],
        hits: json["hits"],
        indexImage: json["index_image"],
        tax: json["tax"],
        brandId: json["brand_id"],
        wholesalePrice: json["wholesale_price"],
        wholesaleCount: json["wholesale_count"],
        image: json["image"],
        newPrice: json["new_price"],
        oldPrice: json["old_price"],
    );

   
}
