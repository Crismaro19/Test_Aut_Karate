function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev";
  }
  var config = {
    env: env,
    myVarName: "someValue",
  };
  if (env == "dev") {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == "e2e") {
    // customize
  }
  var DbUtils = Java.type("examples.database.DbUtils");
  var dbConfig = {
    url: "jdbc:oracle:thin:@//127.0.0.1:1521/free",
    username: "pytdevpe",
    password: "123456",
    driverClassName: "oracle.jdbc.OracleDriver",
  };
  var serverPort = karate.properties["server.port"];
  return {
    config,
    urlBase: "http://localhost:" + serverPort,
    db: new DbUtils(dbConfig),
  };
}
