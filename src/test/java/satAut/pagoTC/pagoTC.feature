Feature: Realizar Pago de tarjetas de crédito y validar transacción

  Background:
    * url 'https://axissatqa1.bancofalabella.cl/axis2/services/SAT_FLALPAGWS.SAT_FLALPAGWSHttpsSoap11Endpoint/'
    * def PAN = '5487405005395753'
    * def SIAIDCD = '1000083185065629980'
    * def IMPFAC = 2
    * def getPagoDeuda = 
    """
    function(siaidcd) {
      var queryString = "SELECT * FROM intsat.mpdt012 WHERE SIAIDCD = '" + siaidcd +"'"
      karate.log('Ejecutando consulta SQL:', queryString)
      var query = dbSat.readRows(queryString)
      return query[0];
    }
    """

  Scenario: Validar que el pago de la tarjetas de crédito 5487405005395753 se guarda correctamente en la base de datos

    # Given el cliente realiza un pago mediante el servicio SOAP
      * header Content-Type = 'text/xml;charset=UTF-8'
      * header SOAPAction = 'urn:runService'
      * request read('requestPagoTc.xml')
      * method post
      * status 200
      * print 'Respuesta del servicio SOAP: ', response
  
    # When el pago es procesado correctamente en el sistema
      * def pago = call getPagoDeuda SIAIDCD
      * karate.log('Transacción pago realizado:', pago)

    # Then la transacción del pago debe quedar registrada en la base de datos y el saldo debe reflejarse correctamente
      * match pago.PAN.trim() == PAN
      * match pago.IMPFAC == IMPFAC    
