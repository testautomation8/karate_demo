@smoke
Feature: Karate Demo

  Background:
    * url 'http://dummy.restapiexample.com/api/v1/'

  @demo
  Scenario: Get customer details
    Given path 'employees'
    When method GET
    Then status 200
    * print  'The response is : ' , response

  Scenario: Create Customer
    Given path "create"
    And request {"name":"demo_automation","salary":"123","age":"23"}
    When  method POST
    Then status 200
    And match response.message contains 'Successfully! Record has been added.'
    * print 'The response is : ' , response

  Scenario Outline: Create Customer : <scenario>
    Given path "create"
    And request {"name":"<name>","salary":"<salary>","age":"<age>"}
    When method POST
    Then status 200
    And match response.message contains 'Successfully! Record has been added.'
    * print 'The response is : ' , response

    Examples:
      | scenario   | name            | salary | age |
      | Scenario_1 | demo_employee_1 | 5000   | 25  |
      | Scenario_2 | demo_employee_2 | 1000   | 27  |

  Scenario Outline: Validate Customer Data : <scenario>
    Given path 'employee/' + <id>
    When method GET
    Then status 200
    And match response.data contains {"id":<id>,"employee_name":"<name>","employee_salary":<salary>,"employee_age":<age>,"profile_image":""}
    * print 'The response is : ' , response

    Examples:
      | scenario   | id | name            | salary | age |
      | Scenario_1 | 1  | Tiger Nixon     | 320800 | 61  |
      | Scenario_2 | 2  | Garrett Winters | 170750 | 63  |