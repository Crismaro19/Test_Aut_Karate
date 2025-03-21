Feature: Consultar 

  Scenario:
    * def query = dbSat.readRows("SELECT codent, centalta, cuenta, limcrecta, salautcre, saldiscre FROM intsat.mpdt163 WHERE CUENTA = '300000537869'")
    * karate.log('query result:', query)
    * match query[0].SALDISCRE == 6137375
