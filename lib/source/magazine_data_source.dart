import 'package:magazine_api/database/models/magazine_model.dart';
import 'package:magazine_api/database/sql_client.dart';


/// data source form MySQL

class MagazineDataSource {
  /// initializing
  MagazineDataSource(
      this.sqlClient,
      );

  ///Fetches all table fields from users table in our database
  ///Fetches all table fields from magazine table from database
  Future<List<MagazineDatabaseModel>> getMagazines() async {
    const sqlQuery = 'SELECT * FROM tbl_magazine;';
    final result = await sqlClient.execute(sqlQuery);
    final magazines = <MagazineDatabaseModel>[];
    for (final row in result.rows) {
      magazines.add(MagazineDatabaseModel.fromRowAssoc(row.assoc()));
    }
    return magazines;
  }
  ///Fetches data from magazine table using id

  Future<List<MagazineDatabaseModel>> getMagazine(String magazineId) async {
    final sqlQuery = 'SELECT * FROM tbl_magazine WHERE magazine_id=$magazineId;';
    final result = await sqlClient.execute(sqlQuery);
    final magazine = <MagazineDatabaseModel>[];
    for (final row in result.rows) {
      magazine.add(MagazineDatabaseModel.fromRowAssoc(row.assoc()));
    }
    return magazine;
  }

  ///Delete data from magazine table using id
  Future<String> deleteMagazine(String magazineId) async {
    final sqlQuery = 'DELETE FROM tbl_magazine WHERE magazine_id=$magazineId;';
    await sqlClient.execute(sqlQuery);
    return 'Deleted Successfully';
  }
  /// accessing you client
  final MySQLClient sqlClient;

}
