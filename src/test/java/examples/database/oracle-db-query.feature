Feature: Realizar consulta SQL en Oracle

  Scenario: Realizar una consulta SQL en Oracle
    * def query = dbTest.readRows('SELECT * FROM PYTDEVPE.T_NOTIFVU_TRXS WHERE ID_TRX = 3017715495')
    * karate.log('query result:', query)
    * match query[0].S_INCOMING_CHANNEL_HANDLER == "WebServiceNotifacionesVU"
