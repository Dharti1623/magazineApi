/// Model based on you table inside MySQL

class MagazineDatabaseModel {
  const MagazineDatabaseModel({
    this.magazineId,
    this.magazineName,
    this.magazineDescription,
    this.magazineThumbnail,
    this.magazineUrl,
  });

  // fromJSON
  factory MagazineDatabaseModel.fromJson(Map<String, dynamic> json) {
    return MagazineDatabaseModel(
      magazineId: json['magazine_id'] as int,
      magazineName: json['magazine_name'] as String,
      magazineDescription: json['magazine_description'] as String,
      magazineThumbnail: json['magazine_thumbnail'] as String,
      magazineUrl: json['magazine_url'] as String,
    );
  }

  // Create an DatabaseModel given a row.assoc() map
  factory MagazineDatabaseModel.fromRowAssoc(Map<String, String?> json) {
    return MagazineDatabaseModel(
      magazineId: int.tryParse(json['magazine_id'].toString()) ,
      magazineName: json['magazine_name'],
      magazineDescription: json['magazine_description'],
      magazineThumbnail: json['magazine_thumbnail'],
      magazineUrl: json['magazine_url'],
    );
  }

  // toJSON
  Map<String, dynamic> toJson() {
    return {
      'magazine_id': magazineId,
      'magazine_name': magazineName.toString(),
      'magazine_description': magazineDescription.toString(),
      'magazine_thumbnail': magazineThumbnail.toString(),
      'magazine_url': magazineUrl.toString(),
    };
  }

  final int? magazineId;
  final String? magazineName;
  final String? magazineDescription;
  final String? magazineThumbnail;
  final String? magazineUrl;
}
