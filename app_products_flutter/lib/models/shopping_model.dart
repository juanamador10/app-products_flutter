class ShoppingCar {
  final int? id;
  final String title;
  final double price;
  final int quantity;

  ShoppingCar(
    {
      this.id,
      required this.price,
      required this.title, 
      required this.quantity
    }
  );

  factory ShoppingCar.fromMap(Map<String, dynamic> json) => ShoppingCar(
    id: json['id'],  
    title: json['title'],
    price: json['price'],
    quantity: json['quantity'],
    );

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'price':price,
      'title': title,
      'quantity':quantity
    };
  }
}