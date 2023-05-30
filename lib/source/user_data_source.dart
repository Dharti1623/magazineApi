import 'package:magazine_api/database/models/user_model.dart';
import 'package:magazine_api/database/sql_client.dart';


/// data source form MySQL

class UserDataSource {
  /// initializing
  UserDataSource(
      this.sqlClient,
      );

  ///Fetches all table fields from users table in our database
  Future<List<UserDatabaseModel>> getUsers() async {
    const sqlQuery = 'SELECT * FROM tbl_users;';
    final result = await sqlClient.execute(sqlQuery);
    final users = <UserDatabaseModel>[];
    for (final row in result.rows) {
      users.add(UserDatabaseModel.fromRowAssoc(row.assoc()));
    }
    return users;
  }

  ///Fetches data from user table using id
  Future<List<UserDatabaseModel>> getUser(String userId) async {
    final sqlQuery = 'SELECT * FROM tbl_users WHERE user_id=$userId;';
    final result = await sqlClient.execute(sqlQuery);
    final user = <UserDatabaseModel>[];
    for (final row in result.rows) {
      user.add(UserDatabaseModel.fromRowAssoc(row.assoc()));
    }
    return user;
  }

  ///Delete data from user table using id
  Future<String> deleteUser(String userId) async {
    final sqlQuery = 'DELETE FROM tbl_users WHERE user_id=$userId;';
    await sqlClient.execute(sqlQuery);
    return 'Deleted Successfully';
  }

  ///insert data in user table
  Future<String> insertUser(List keys, List values) async {
    final sqlQuery = 'INSERT INTO tbl_users (${keys.join(",")}) VALUES (${values.join(",")})';
    final result = await sqlClient.execute(sqlQuery);
    return 'Inserted successfully';
  }

  ///Update data from user table using id
  Future<String> updateUser(List values,String userId) async {
    final sqlQuery = 'UPDATE tbl_users SET ${values.join(",").toString()} WHERE user_id= $userId;';
    await sqlClient.execute(sqlQuery);
    return 'Updated successfully';
  }


  /// accessing you client
  final MySQLClient sqlClient;
}
