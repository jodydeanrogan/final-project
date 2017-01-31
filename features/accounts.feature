Feature: An unregistered user creates a user account
  As an unregistered user, I should be able to register for an account

  @poltergeist
  Scenario: A user is required to complete a form to register for an account
    When I navigate to "/home"
    Then I should see the "Email" form label
      And I should be required to fill in "user_email" with a "Email" when registering
    Then I should see the "Password" form label
      And I should be required to fill in "user_password" with a "Password" when registering

  @poltergeist
  Scenario: A user visits login page to log into site
    When I navigate to "/log_in"
    Then I should see the "Email" form label
      And I should be required to fill in "user_email" with a "Email" when signing in
    Then I should see the "Password" form label
      And I should be required to fill in "user_password" with a "Password" when signing in

  @poltergeist
  Scenario: A user visits forgot password page to to get reset instructions
    When I navigate to "/forgot_password/new"
    Then I should see the "Email" form label
      And I should be required to fill in "user_email" with a "Email" when requesting reset instructions
