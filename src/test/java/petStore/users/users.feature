Feature: Test 'User' APIs

  Background:
    #Take below data from the respective data file
    * def user_data = { "id": 1, "username": "Automation Tester" ,"firstName": "Automation ","lastName": "Tester","email": "AutomationTester@email.com","password": "automationtester","phone": "9999999999","userStatus": 0}
    * url 'https://petstore.swagger.io/v2/'

  Scenario: Create single user using POST endpoint for provided data
    Given path 'user'
    And request user_data
    When method POST
    Then status 200
    * print  'The response is : ' , response

  Scenario: Check existing User details from the System by providing 'Username'
    Given path 'user/' + user_data.username
    When method GET
    Then status 200
    And match response.email contains user_data.email
    * print  'The response is : ' , response

  Scenario: Check for Invalid User
    Given path 'user/' + 'Invalid_User'
    When method GET
    Then status 404
    And match response.message contains 'User not found'
    * print  'The response is : ' , response

  Scenario: Check 'Login' for the valid user
    Given path 'user/login/'
    And params {username: user_data.username, password: user_data.password}
    When method GET
    Then status 200
    And match response contains logged in user session
    And print response



