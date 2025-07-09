/// Food Class
/// Descripes the food to display using name, price, and image
class Food {
  String foodName;
  double price;
  /// Stored in images asset file
  String imageUrl = 'images/MaddyMueller.jpeg';

  Food({
    required this.foodName,
    required this.price,
    this.imageUrl = 'images/MaddyMueller.jpeg',
  });
}
