Feature: Realizar consulta SQL en Oracle

Background:     
  * def consultaIdTrx = 
    """
    function(idTrx) {
      var query = dbTest.readRows("SELECT * FROM PYTDEVPE.T_NOTIFVU_TRXS WHERE ID_TRX = " + idTrx )
      karate.log('query result:', query)
      return query[0].S_INCOMING_CHANNEL_HANDLER;
    }
    """

  Scenario: Realizar una consulta SQL en Oracle
    * def query = dbTest.readRows('SELECT * FROM PYTDEVPE.T_NOTIFVU_TRXS WHERE ID_TRX = 3017715495')
    * karate.log('query result:', query)
    * match query[0].S_INCOMING_CHANNEL_HANDLER == "WebServiceNotifacionesVU"

  Scenario: Realizar una consulta SQL fn
    * def resTrx = call consultaIdTrx 3017715495
    * karate.log('query result:', resTrx)
    * match  resTrx == "WebServiceNotifacionesVU"