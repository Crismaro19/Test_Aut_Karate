Feature: Users
  Background:
    * url 'https://reqres.in'

  Scenario: Get All users
    Given path '/api/users?page=2'
    When method get
    Then status 200