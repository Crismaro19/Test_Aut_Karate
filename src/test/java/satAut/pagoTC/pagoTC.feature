Feature: Realizar Pago de tarjetas de crédito y validar transacción

  Background:
    # EndPoint consumo de servicio
    * url 'https://axissatqa1.bancofalabella.cl/axis2/services/SAT_FLALPAGWS.SAT_FLALPAGWSHttpsSoap11Endpoint/'
   
    # Definicion de constantes para el escenario
    * def PAN = '5487405005395753'
    * def SIAIDCD = '1000083185065629983' # Un valor diferente por transacción
    * def IMPFAC = 103
    * def VALUEDATE = "24-03-2025" # Cambiar fecha según día de transaccion
    
  Scenario: Validar que el pago de la tarjetas de crédito 5487405005395753 se guarda correctamente en la base de datos

    # Given el cliente realiza un pago mediante el servicio SOAP
      * header Content-Type = 'text/xml;charset=UTF-8'
      * header SOAPAction = 'urn:runService'
      * request read('requestPagoTc.xml')
      * method post
      * status 200
      * print 'Respuesta del servicio SOAP: ', response
  
    # When el pago es procesado correctamente en el sistema
      * def pago = call read('defGetPagoDeuda.js') SIAIDCD
      * karate.log('Transacción pago realizado:', pago)

    # Then la transacción del pago debe quedar registrada en la base de datos y el saldo debe reflejarse correctamente
      * match pago.PAN.trim() == PAN
      * match pago.IMPFAC == IMPFAC    
