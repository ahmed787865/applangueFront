class Product {
  String name;
  String price;
  bool isFavorite;
  bool addedToCart;

  Product({
    required this.name,
    required this.price,
    this.isFavorite = false,
    this.addedToCart = false,
  });
}
