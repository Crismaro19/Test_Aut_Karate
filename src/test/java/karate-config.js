function fn() {
  var DbUtils = Java.type("config.DbUtils");
  var dbConfigSat = {
    url: "jdbc:oracle:thin:@//10.140.40.149:1521/SATPRETM",
    username: "",
    password: "",
    driverClassName: "oracle.jdbc.OracleDriver",
  };

  var dbConfigTest = {
    url: "jdbc:oracle:thin:@//127.0.0.1:1521/free",
    username: "pytdevpe",
    password: "123456",
    driverClassName: "oracle.jdbc.OracleDriver",
  };

  return {
    dbSat: new DbUtils(dbConfigSat),
    dbTest: new DbUtils(dbConfigTest),
  };
}
