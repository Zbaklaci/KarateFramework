Feature: Parameters Tests

  Background:
    * def baseUrl = 'https://api.fastforex.io/fetch-all?api_key=fcc6ad62c9-640ab9dd53-r3orcl'
    * def spartanUrl = 'http://3.82.206.120:8000/api/spartans'
    * def hrUrl = 'http://3.82.206.120:1000/ords/hr'

  Scenario: path parameters
    Given url baseUrl
    When method GET
    Then status 200

  Scenario: path parameters
    Given url spartanUrl
    And path "12"
    When method get
    And print response
    Then status 200
    And  print response
    And match response == expectedSpartan

  Scenario: one spartan
    * def expectedSpartan =
  """
      {
     "id": 12,
     "name": "Sol",
     "gender": "Male",
     "phone": 7006438852
}
      """
    Given url spartanUrl
    And path 12
    * method get
    And print response
    Then status 200
    And  print response
    And match response == expectedSpartan


  Scenario: query parameters
    Given url spartanUrl
    And print '/search'
    And param nameContains = 'A'
    And param gender = 'Female'
    When method GET
    Then  status 200
    And match header Connection == 'keep-alive'
    And print response
#    And match response.pageable.pageNumber == null
#        #verify each content has gender = Female
#    And match each response.content contains {"gender":"Female"}
#    #second way of iteration
#   And match each response.gender == 'Female'
#   And match each response.name == 'Anisa'
  
  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method GET
    Then status 200
    And path response
    And match response.limit == 25
    And match each response.items[*].region_id == '#number'
    And print each response.items[*].region_id


