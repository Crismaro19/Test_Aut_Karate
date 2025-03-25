// Definicion de funciones globales
function fn() {
  var config = karate.read("file:.env.json");

  var DbUtils = Java.type("config.DbUtils");

  var dbConfigSat = {
    url: config.SAT_BD_ENDPOINT,
    username: config.SAT_BD_USUARIO,
    password: config.SAT_BD_CLAVE,
    driverClassName: "oracle.jdbc.OracleDriver",
  };

  var dbConfigTest = {
    url: config.TEST_BD_ENDPOINT,
    username: config.TEST_BD_USUARIO,
    password: config.TEST_BD_CLAVE,
    driverClassName: "oracle.jdbc.OracleDriver",
  };

  return {
    dbSat: new DbUtils(dbConfigSat),
    dbTest: new DbUtils(dbConfigTest),
  };
}
