Feature: Create an adventure
  Scenario: User creates an adventure

    Given I am a logged in user
    And I go to my dashboard
    When I create a new Adventure

    Then I should be on the "Create an Adventure" page

    #    When I add a name
    #And I add a description
    #And I add five checkpoints with touts and locations
    #And I save the Adventure
    #Then I should be back on my dashboard

