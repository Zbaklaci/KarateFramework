Feature: get user token

  Scenario: get one user token
    Given url 'https://cybertek-reservation-api-docs.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'sbirdbj@fc2.com'
    And param password = 'asenorval'
    When method Get
    Then status 200
    And print response.accessToken
    And def token = response.accessToken