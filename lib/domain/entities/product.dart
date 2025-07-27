class Product {
  String id;
  String imageName;
  String productName;
  String productContent;
  String seller;
  String price;
  String address;
  int favorite;
  int chat;
  bool isFavorite;

  Product({
    required this.id,
    required this.imageName,
    required this.productName,
    required this.productContent,
    required this.seller,
    required this.price,
    required this.address,
    required this.favorite,
    required this.chat,
    this.isFavorite = false,
  });

  Product copyWith({
    String? id,
    String? imageName,
    String? productName,
    String? productContent,
    String? seller,
    String? price,
    String? address,
    int? favorite,
    int? chat,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      imageName: imageName ?? this.imageName,
      productName: productName ?? this.productName,
      productContent: productContent ?? this.productContent,
      seller: seller ?? this.seller,
      price: price ?? this.price,
      address: address ?? this.address,
      favorite: favorite ?? this.favorite,
      chat: chat ?? this.chat,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
