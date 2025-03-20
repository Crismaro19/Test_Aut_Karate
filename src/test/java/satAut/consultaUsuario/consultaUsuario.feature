Feature: test sat soap service

  Background:
    * url 'https://axissatqa1.bancofalabella.cl/axis2/services/SAT_FLCLCCTWS.SAT_FLCLCCTWSHttpsSoap12Endpoint/'

  Scenario: consumo servicio consulta
    Given header Content-Type = 'application/soap+xml;charset=UTF-8;action="urn:runService"'
    And header SOAPAction = 'urn:runService'
    And request
    """
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:web="http://webservice.sat.mediosdepago.tecnocom.com" xmlns:xsd="http://satNewAge.soapwebservices.ease/xsd" xmlns:xsd1="http://webservice.sat.mediosdepago.tecnocom.com/xsd">
    <soap:Header/>
    <soap:Body>
      <web:runService>
         <web:msgEnvio>
            <xsd:entidad>0015</xsd:entidad> 
            <xsd:password>Sat20mar</xsd:password>
            <xsd:tipoOperacion>VIEW</xsd:tipoOperacion>
            <xsd:usuario>USUWSERV</xsd:usuario>
            <xsd1:calpart>TI</xsd1:calpart>
            <xsd1:numdoc>16104038K</xsd1:numdoc>
            <xsd1:tipdoc>001</xsd1:tipdoc>
            <xsd1:indproducto>TC</xsd1:indproducto>
         </web:msgEnvio>
      </web:runService>
    </soap:Body>
    </soap:Envelope>
    """
    When method post
    Then status 200
    And print 'response: ', response
