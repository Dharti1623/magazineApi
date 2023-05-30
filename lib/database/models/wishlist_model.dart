/// Model based on you table inside MySQL

class WishlistDatabaseModel {
  const WishlistDatabaseModel({
    this.wishhlistId,
    this.userId,
    this.magazineId,
    this.magazineName,
    this.magazineDescription,
    this.magazineThumbnail,
    this.magazineUrl,
    this.userName,
    this.userEmail,
    this.userPassword,

  });

  /// fromJSON
  factory WishlistDatabaseModel.fromJson(Map<String, dynamic> json) {
    return WishlistDatabaseModel(
      wishhlistId: json['wishlist_id'] as int,
      userId: json['user_id'] as int,
      magazineId: json['magazine_id'] as int,
      magazineName: json['magazine_name'] as String,
      magazineDescription: json['magazine_description'] as String,
      magazineThumbnail: json['magazine_thumbnail'] as String,
      magazineUrl: json['magazine_url'] as String,
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      userPassword: json['user_password'] as String,

    );
  }

  /// Create an DatabaseModel given a row.assoc() map
  factory WishlistDatabaseModel.fromRowAssoc(Map<String, String?> json) {
    return WishlistDatabaseModel(
      wishhlistId: int.tryParse(json['wishlist_id'].toString()) ,
      userId: int.tryParse(json['user_id'].toString()) ,
      magazineId: int.tryParse(json['magazine_id'].toString()) ,
      magazineName: json['magazine_name'],
      magazineDescription: json['magazine_description'],
      magazineThumbnail: json['magazine_thumbnail'],
      magazineUrl: json['magazine_url'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userPassword: json['user_password'],
    );
  }

  /// toJSON
  Map<String, dynamic> toJson() {
    return {
      'wishlist_id': wishhlistId,
      'user_id': userId,
      'magazine_id': magazineId,
      'magazine_name': magazineName.toString(),
      'magazine_description': magazineDescription.toString(),
      'magazine_thumbnail': magazineThumbnail.toString(),
      'magazine_url': magazineUrl.toString(),
      'user_name': userName.toString(),
      'user_email': userEmail.toString(),
      'user_password': userPassword.toString(),
    };
  }

  final int? wishhlistId;
  final int? userId;
  final int? magazineId;
  final String? magazineName;
  final String? magazineDescription;
  final String? magazineThumbnail;
  final String? magazineUrl;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
}
