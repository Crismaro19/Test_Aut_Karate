Feature: test sat soap service

  Background:
    * url 'https://axissatqa1.bancofalabella.cl/axis2/services/SAT_FLALPAGWS.SAT_FLALPAGWSHttpsSoap11Endpoint/'
    * def getMontoDeuda = 
    """
    function(accountNumber) {
      var query = dbSat.readRows("SELECT codent, centalta, cuenta, limcrecta, salautcre, saldiscre FROM intsat.mpdt163 WHERE CUENTA = '" + accountNumber + "'")
      return query[0].SALDISCRE;
    }
    """

  Scenario: Pago de TC y verificación del saldo
    Given Obtengo el monto deuda de la cuenta
    * def saldoInicial = call getMontoDeuda '300000537869'
    * karate.log('Saldo inicial de la deuda:', saldoInicial)
    * match saldoInicial == 6137375

    When Realizo un pago utilizando el servicio SOAP con la solicitud
    * header Content-Type = 'text/xml;charset=UTF-8'
    * header SOAPAction = 'urn:runService'
    * request read('requestPagoTc.xml')
    * method post
    * status 200
    * print 'Respuesta del servicio SOAP: ', response
  
    Then Verifico que el saldo después del pago se haya restado correctamente
    * def saldoFinal = call getMontoDeuda '300000537869'
    * def montoPago = 1
    * def saldoEsperado = saldoInicial - montoPago
    * karate.log('Saldo después del pago:', saldoFinal)
    * match saldoFinal == saldoEsperado
    
    
    # Given header Content-Type = 'text/xml;charset=UTF-8'
    # And header SOAPAction = 'urn:runService'
    # And request read('requestPagoTc.xml')
    # When method post
    # Then status 200
    # And print 'response: ', response
