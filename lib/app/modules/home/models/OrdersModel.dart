class Ordersmodel {
  final String id;
  final String customerName;
  final String pickupLocation;
  final String deliveryLocation;
  final double amount;
  final String status;
  final String orderTime;

  Ordersmodel({
    required this.id,
    required this.customerName,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.amount,
    required this.status,
    required this.orderTime,
  });
  factory Ordersmodel.fromJson(Map<String, dynamic> json) {
    return Ordersmodel(
      id: json['id'],
      customerName: json['customerName'],
      pickupLocation: json['pickuplocation'],
      deliveryLocation: json['deliveryLocation'],
      amount: json['amount'],
      status: json['status'],
      orderTime: json['status'],
    );
  }
}
