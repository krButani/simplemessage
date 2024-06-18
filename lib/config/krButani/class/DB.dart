
part of 'config.dart';

/* 
  developer: krButani
  How to  Used

  Create DB Object
  DB db = new DB();


  --------------------------------------------------------------------------------
  Count Record
  --------------------------------------------------------------------------------

  db.count("SELECT COUNT(*) FROM ${DB.TABLE}").then((value) {
      // its return count
      print("Count: " + value.toString());
    });

  --------------------------------------------------------------------------------
  Select Record
  --------------------------------------------------------------------------------

  db.getData("SELECT * FROM ${DB.TABLE}").then((mp) {
      // it return array of object
      if (mp.length > 0) {
        for (int i = 0; i < mp.length; i++) {
          mp[i].forEach((k, v) {
            print(v);
          });
        }
      }
    });

  --------------------------------------------------------------------------------
  Insert Record
  --------------------------------------------------------------------------------
  String qry = "INSERT INTO ${DB.TABLE} (${DB.NAME}) VALUES ('krButani')";
  db.save(qry).then((value) {
    // Value return 0 if not success 1 if success
    print(value);
  });


  --------------------------------------------------------------------------------
  Update Record
  --------------------------------------------------------------------------------

  db.update("UPDATE ${DB.TABLE} SET ${DB.NAME}='Hello' WHERE ${DB.ID}='4'")
        .then((value) {
      // Value return 0 if not success 1 if success
      print("Update: " + value.toString());
    });



  --------------------------------------------------------------------------------
  Delete Record
  --------------------------------------------------------------------------------

  db.delete("DELETE FROM ${DB.TABLE} WHERE ${DB.ID}='6'").then((value) {
     // return 0 : if not delete 1: means delete
      print("Delete: " + value.toString());
    });


 */
class DatabaseData {
  List<String> col = [];
  List<String> datatype = [];
  String tblnm = "";

  String createTable() {
    String str = "";
    if (tblnm != "" && col.length == datatype.length && col.length > 0) {
      str += "CREATE TABLE IF NOT EXISTS " + tblnm + "(";
      for (var i = 0; i < col.length; i++) {
        if (i != 0) str += ", ";
        str += "${col[i]} ${datatype[i]}";
      }
      str += ");";
    }
    return str;
  }

  String selectAll() {
    String str = "";
    str += "SELECT * FROM " + tblnm;
    return str;
  }

  String getDeleteAll() {
    String str = "";
    str += "DELETE FROM " + tblnm;
    return str;
  }

  String getInsertRecord(List<String> tcol, List<String> tval) {
    String str = "";
    if (tblnm != "" && tcol.length == tval.length && tcol.length > 0) {
      str += "INSERT INTO " + tblnm + "(";
      for (var i = 0; i < tcol.length; i++) {
        if (i != 0) str += ", ";
        str += "${tcol[i]}";
      }
      str += ") VALUES (";
      for (var i = 0; i < tval.length; i++) {
        if (i != 0) str += ", ";
        if (tval[i] == "null")
          str += "${tval[i]}";
        else
          str += "'${tval[i]}'";
      }
      str += ");";
    }
    return str;
  }
}

class DB {
  static Database? _db;
  static const String DB_NAME = 'simpleMessage.db';
  List<String> tbl = [
    "users",
  ];
  List<DatabaseData> coldata = [];
  List<DatabaseData> workinglist = [];

  DB() {
    for (var i = 0; i < tbl.length; i++) {
      DatabaseData cd = new DatabaseData();
       if (tbl[i] == "users") {
        cd.tblnm = tbl[i];
        cd.col = [
          "id",
          "storeid",
          "firstname",
          "lastname",
          "email",
          "message",
        ];
        cd.datatype = [
          "INTEGER PRIMARY KEY",
          "TEXT",
          "TEXT",
          "TEXT",
          "TEXT",
          "TEXT"
        ];
      }

      coldata.add(cd);
    }
  }

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1);
    return db;
  }

  Future<void> onCreate(List<String> who) async {
    var dbClient = await db;
    for (var i = 0; i < who.length; i++) {
      for (var j = 0; j < coldata.length; j++) {
        if (coldata[j].tblnm == who[i]) {
          DatabaseData k = coldata[j];
          String tc = k.createTable();
          if (tc != "") {
            await dbClient!.execute(tc);
            workinglist.add(coldata[j]);
          }
        }
      }
    }
  }

  Future<int> save(String str) async {
    var dbClient = await db;

    //return await dbClient.insert(TABLE, employee.toMap());

    return await dbClient!.transaction((txn) async {
      var query = str;
      return await txn.rawInsert(query);
    });
  }

  Future<List<Map>> getData(String qry) async {
    var dbClient = await db;
    //List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME]);
    List<Map> maps = await dbClient!.rawQuery(qry);
    /* List<Employee> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Employee.fromMap(maps[i]));
      }
    } */
    return maps;
  }

  Future<int> count(String qry) async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.rawQuery(qry);
    int c = 0;
    if (maps.length > 0) {
      maps[0].forEach((k, v) {
        c = v;
        //print(v.toString());
      });
      /* for (var d in maps) {
        d.forEach((k, v) => print(v));

        print(d[(d.keys).first]);
      } */

    }
    return c;
  }

  Future<int> delete(String qry) async {
    var dbClient = await db;
    return await dbClient!.rawDelete(qry);
  }

  Future<int> update(String qry) async {
    var dbClient = await db;
    return await dbClient!.rawUpdate(qry);
  }

  Future<int> deletewithpara(String qry, List<String> mp) async {
    var dbClient = await db;
    return await dbClient!.rawDelete(qry, mp);
  }

  Future<int> updatewithpara(String qry, List<String> mp) async {
    var dbClient = await db;
    return await dbClient!.rawUpdate(qry, mp);
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }
}
