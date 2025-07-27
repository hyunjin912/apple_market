class ProductDto {
  String id;
  String imageName;
  String productName;
  String productContent;
  String seller;
  String price;
  String address;
  int favorite;
  int chat;

  ProductDto({
    required this.id,
    required this.imageName,
    required this.productName,
    required this.productContent,
    required this.seller,
    required this.price,
    required this.address,
    required this.favorite,
    required this.chat,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
    id: json["id"],
    imageName: json["imageName"],
    productName: json["productName"],
    productContent: json["productContent"],
    seller: json["seller"],
    price: json["price"],
    address: json["address"],
    favorite: json["favorite"],
    chat: json["chat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imageName": imageName,
    "productName": productName,
    "productContent": productContent,
    "seller": seller,
    "price": price,
    "address": address,
    "favorite": favorite,
    "chat": chat,
  };
}
