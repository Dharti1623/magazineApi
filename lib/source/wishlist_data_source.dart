import 'package:magazine_api/database/models/wishlist_model.dart';
import 'package:magazine_api/database/sql_client.dart';

/// data source form MySQL

class WishlistDataSource {
  /// initializing
  WishlistDataSource(
    this.sqlClient,
  );

  ///Fetches all table fields from wishlist table in our database
  Future<List<WishlistDatabaseModel>> getWishlists() async {
    // const sqlQuery = 'SELECT * FROM tbl_wishlist;';
    const sqlQuery =
        'SELECT * FROM tbl_wishlist,tbl_users,tbl_magazine WHERE tbl_wishlist.user_id=tbl_users.user_id AND tbl_wishlist.magazine_id=tbl_magazine.magazine_id;';
    final result = await sqlClient.execute(sqlQuery);
    final wishlists = <WishlistDatabaseModel>[];
    for (final row in result.rows) {
      wishlists.add(WishlistDatabaseModel.fromRowAssoc(row.assoc()));
    }
    return wishlists;
  }

  ///Fetches data from wishlist table using user id
  Future<List<WishlistDatabaseModel>> getWishlistByUser(String userId) async {
    final sqlQuery = 'SELECT * FROM tbl_wishlist,tbl_users,tbl_magazine WHERE tbl_wishlist.user_id=$userId AND tbl_wishlist.user_id=tbl_users.user_id AND tbl_wishlist.magazine_id=tbl_magazine.magazine_id;';
    final result = await sqlClient.execute(sqlQuery);
    final data = <WishlistDatabaseModel>[];
    for (final row in result.rows) {
      data.add(WishlistDatabaseModel.fromRowAssoc(row.assoc()));
    }
    return data;
  }

  ///Delete data from wishlist table using id
  Future<String> deleteWishlist(String wishlistId) async {
    final sqlQuery = 'DELETE FROM tbl_wishlist WHERE wishlist_id=$wishlistId;';
    await sqlClient.execute(sqlQuery);
    return 'Deleted Successfully';
  }

  ///insert data in wishlist table
  Future<String> insertWishlist(List keys, List values) async {
    final sqlQuery =
        'INSERT INTO tbl_wishlist (${keys.join(",")}) VALUES (${values.join(",")})';
    await sqlClient.execute(sqlQuery);
    return 'Inserted successfully';
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
