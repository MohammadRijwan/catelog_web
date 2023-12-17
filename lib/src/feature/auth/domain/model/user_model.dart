class UserModel {
  final String? userId;
  final String? registerDate;
  final String? name;
  final String? email;
  final String? profilePictureUrl;
  final String? userType;

  UserModel({
    this.userId,
    this.registerDate,
    this.name,
    this.email,
    this.profilePictureUrl,
    this.userType,
  });
  factory UserModel.fromJson(Map json, String userId) {
    return UserModel(
      userId: userId,
      registerDate: json['registerDate'],
      name: json['name'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
      userType: json['userType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'registerDate': registerDate,
        'name': name,
        'email': email,
        'profilePictureUrl': profilePictureUrl,
        'userType': userType,
      };
}
