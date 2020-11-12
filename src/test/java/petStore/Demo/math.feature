@math
Feature: Math Calculations

  Background:

    * url 'http://api.mathjs.org/v4/'

  Scenario: Test Addition

    Given  param expr = '2+3'
    When method GET
    Then status 200
    And match response contains 5
    * print  'The response is : ' , response

    Given param expr = '11-' + response
    When method GET
    Then status 200
    And match response contains 6
    * print  'The response is : ' , response
