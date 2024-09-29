enum UserRole {
  customer(id: "BYyIp3WN3yFSCf6IAohE"),
  seller(id: "9X1Bqg3OGqKwnY2Sqf74");

  const UserRole({
    required this.id,
  });

  final String id;

  factory UserRole.fromId(String id) {
    return UserRole.values.firstWhere(
      (el) => el.id == id,
      orElse: () => UserRole.customer,
    );
  }

  bool get isSeller => this == UserRole.seller;
  bool get isCustomer => this == UserRole.customer;
}
