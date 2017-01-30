Feature: An unregistered user creates a user account
  As an unregistered user, I should be able to register for an account

  @poltergeist
  Scenario: A user is required to complete a form to register for an account
    When I navigate to "/home"
    Then I should see the "Email" form label
      And I should be required to fill in "user_email" with a "Email" when registering
