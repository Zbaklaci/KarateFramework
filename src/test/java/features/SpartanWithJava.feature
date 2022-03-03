Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://3.82.206.120:8000/api/spartans'

  Scenario: Get a spartan with request header
    Given url spartanUrl
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: Create anew spartan
    Given url spartanUrl
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
      """
      {
     "name": "Lorenza",
     "gender": "Female",
     "phone": 7006431234
      }
      """
    When method Post
    Then status 201
    And print response

  Scenario: reading java methods
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    * print newSpartan


  Scenario: Create a spartan with Random Data (JAVA)
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    Given url spartanUrl
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method Post
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
    And match response.data.name == newSpartan.name
    And def idToDelete = response.data.id
    Given url spartanUrl
    And path idToDelete
    When method DELETE
    Then status 204


