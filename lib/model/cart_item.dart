class CartItem {
  String name;
  String variant;
  int quantity;
  double price;
  bool isSelected;

  CartItem({
    required this.name,
    required this.variant,
    required this.quantity,
    required this.price,
    this.isSelected = false,
  });
}
