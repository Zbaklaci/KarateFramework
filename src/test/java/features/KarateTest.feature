Feature: karate first
  
  Scenario: how to print
    Given print "Hello World"
    When print "karate test1"
    Then print "test again"
    
    
    Scenario: more work
      Given print 'some words printing'
      * print 'my new frame is','karate framework'
      * print 2+2

      Scenario: variables
        * def name = 'zeynep'
        * print 'my name is'+ name
        * def age = 20
        * print name, 'is',age, 'years old'

  Scenario: json object
    * def student = {'name':'zehra','owes_tuition':false}
    * print student
    * print student.name
    * print student.owes_tuition

  Scenario: json object 2
    * def employee =
    """
    {
      "firstName":"Steven",
      "lastName": "King",
      "salary":2099
    }
    """
    * print employee.salary
    * print employee.firstName
    * print employee.owes_tuition

  Scenario: Spartan Variable
    * def spartan =
  """
       {
               "id": 1,
               "name": "Anisa",
               "gender": "Female",
               "phone": 6666666666
          }
      """
    * print spartan.gender
    * print spartan.phone
    * print spartan.name
    * print spartan.id

  Scenario: json array objects
    * def employees =
  """
      [
       {
      "firstName":"Steven",
      "lastName": "King",
      "salary":2099
    },
     {
      "firstName":"Sam",
      "lastName": "Taylor",
      "salary":3988
    }
      ]
      """
    * print employees
    * print employees[0].lastName
    * print employees[1].salary

