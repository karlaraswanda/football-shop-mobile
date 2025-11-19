// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String description;
    int price;
    String category;
    String thumbnail;
    bool isFeatured;
    String brand;
    int stock;
    String size;
    int? userId;
    String? userUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.category,
        required this.thumbnail,
        required this.isFeatured,
        required this.brand,
        required this.stock,
        required this.size,
        required this.userId,
        required this.userUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        brand: json["brand"],
        stock: json["stock"],
        size: json["size"],
        userId: json["user_id"],
        userUsername: json["user_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "brand": brand,
        "stock": stock,
        "size": size,
        "user_id": userId,
        "user_username": userUsername,
    };
}