class UserModel {
  final String userID;
  final String name;
  final String number;
  final String email;
  final String address;

  UserModel({
    required this.userID,
    required this.name,
    required this.number,
    required this.email,
    required this.address,
  });

  factory UserModel.fromMap(
      {required Map<String, dynamic> map, required String userID}) {
    return UserModel(
      userID: userID,
      name: map["name"],
      number: map["number"],
      email: map["email"],
      address: map["address"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "firstName": name,
      "lastName": number,
      "contact": email,
      "prno": address,
    };
  }
}
