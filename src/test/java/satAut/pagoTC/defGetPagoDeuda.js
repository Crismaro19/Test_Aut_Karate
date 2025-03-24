function getPagoDeuda(siaidcd) {
  var queryString =
    "SELECT * FROM intsat.mpdt012 WHERE SIAIDCD = '" + siaidcd + "'";
  karate.log("Ejecutando consulta SQL:", queryString);
  var query = dbSat.readRows(queryString);
  return query[0];
}
