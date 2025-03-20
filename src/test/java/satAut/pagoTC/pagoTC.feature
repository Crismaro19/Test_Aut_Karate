Feature: test sat soap service

  Background:
    * url 'https://axissatqa1.bancofalabella.cl/axis2/services/SAT_FLALPAGWS.SAT_FLALPAGWSHttpsSoap11Endpoint/'

  Scenario: pago TC




    Given header Content-Type = 'text/xml;charset=UTF-8'
    And header SOAPAction = 'urn:runService'
    And request read('requestPagoTc.xml')
    When method post
    Then status 200
    And print 'response: ', response





    