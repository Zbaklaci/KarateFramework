
  Feature: Bookit Api tests

    Background:
      * def baseUrl = 'https://cybertek-reservation-api-docs.herokuapp.com/'
      #point another feature file
      * def AuthFeature = call read('classpath:features/BookItAuth.feature')
      * def accessToken = AuthFeature.token
      * print 'Token From Background' ,accessToken

      @wip
      Scenario: get user information
        Given url baseUrl
        And path 'api/users/me'
        And header Authorization = 'Bearer '+accessToken
        And header Accept = 'application/json'
        When method Get
        Then status 200
        And print response