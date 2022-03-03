Feature: exchange rate api tests

  Scenario: basic test with status code validation
    Given url 'https://api.fastforex.io/fetch-all?api_key=fcc6ad62c9-640ab9dd53-r3orcl'
    When  method GET
    Then status 200


  Scenario: get rates fro specific day
    Given url 'https://api.fastforex.io/historical?date=2021-12-02&api_key=fcc6ad62c9-640ab9dd53-r3orcl'
    When  method Get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Date == '#present'

  Scenario: json body verification
    Given url 'https://api.fastforex.io/historical?date=2021-12-02&api_key=fcc6ad62c9-640ab9dd53-r3orcl'
    When  method Get
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And print response.base
        #verify base is USD
    And match response.base == 'USD'
    And print response
    And print response.base
    And match response.results.EUR == '#present'
    And match response.results.EUR == 0.88334


