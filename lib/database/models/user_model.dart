/// Model based on you table inside MySQL

class UserDatabaseModel {
  const UserDatabaseModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
  });

  // fromJSON
  factory UserDatabaseModel.fromJson(Map<String, dynamic> json) {
    return UserDatabaseModel(
      userId: json['user_id'] as int,
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      userPassword: json['user_password'] as String,
    );
  }

  // Create an DatabaseModel given a row.assoc() map
  factory UserDatabaseModel.fromRowAssoc(Map<String, String?> json) {
    return UserDatabaseModel(
      userId: int.tryParse(json['user_id'].toString()) ,
      userName: json['user_name'],
      userEmail: json['user_email'],
      userPassword: json['user_password'],
    );
  }

  // toJSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName.toString(),
      'user_email': userEmail.toString(),
      'user_password': userPassword.toString(),
    };
  }

  final int? userId;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
}
