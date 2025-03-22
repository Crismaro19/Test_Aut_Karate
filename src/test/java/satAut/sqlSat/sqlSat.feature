Feature: Consultar

Background:
  * def PAN = '5487405005395753'
  * def SIAIDCD = '1000053185065629993'
  * def IMPFAC = 99
  * def getPagoDeuda = 
  """
  function(siaidcd) {
    var queryString = "SELECT * FROM intsat.mpdt012 WHERE SIAIDCD = '" + siaidcd +"'"
    karate.log('Ejecutando consulta SQL:', queryString)
    var query = dbSat.readRows(queryString)
    return query[0];
  }
  """

  Scenario:
    * def query = dbSat.readRows("SELECT * FROM intsat.mpdt012 WHERE pan = '5487405005395753' AND SIAIDCD = '1000053185065629993' AND IMPLIQ = '99'")
    * karate.log('query result:', query)
    * match query[0].SIAIDCD == '1000053185065629993'

  Scenario: 
    * def pago = call getPagoDeuda SIAIDCD
    * karate.log('Transacción pago realizado:', pago)
    * match pago.PAN.trim() == PAN
    * match pago.IMPFAC == IMPFAC

