class FoodItem {
  final String id;
  final String name;
  final double price;
  final String image ;
  int quantity;

  FoodItem({
    required this.image,
    required this.id,
    required this.name, 
    required this.price,
    this.quantity = 1,
  });
}
