
class SearchModel {
    Product product;
    Image image;
    dynamic oldPrice;
    String newPrice;

    SearchModel({
        required this.product,
        required this.image,
        required this.oldPrice,
        required this.newPrice,
    });

  

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        product: Product.fromJson(json["product"]),
        image: Image.fromJson(json["image"]),
        oldPrice: json["oldPrice"],
        newPrice: json["newPrice"],
    );

   
}

class Image {
    int id;
    String name;
    String mimeType;
    String path;
    String ownerType;
    String ownerId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic caption;

    Image({
        required this.id,
        required this.name,
        required this.mimeType,
        required this.path,
        required this.ownerType,
        required this.ownerId,
        required this.createdAt,
        required this.updatedAt,
        required this.caption,
    });

   
    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        mimeType: json["mime_type"],
        path: 'https://dargaz-yadak.ir/${json["path"]}',
        ownerType: json["owner_type"],
        ownerId: json["owner_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        caption: json["caption"],
    );

   
}

class Product {
    int id;
    String title;
    String slug;
    String price;
    String discount;
    String indexImage;

    Product({
        required this.id,
        required this.title,
        required this.slug,
        required this.price,
        required this.discount,
        required this.indexImage,
    });

    

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        discount: json["discount"],
        indexImage: json["index_image"],
    );

   
}
