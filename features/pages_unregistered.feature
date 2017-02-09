Feature: An unregistered user visits home page
  As an unregistered user, I should be able to see the home page

  @poltergeist
  Scenario: An unregistered user navigates to the home page
    When I navigate to "/home"
    Then I should see "Blender" on the page
      And I should see "Home" on the page
      And I should see "Activities" on the page
      And I should see "Login" on the page
      And I should see "Register" on the page
      And I should see "Blending technology and education" on the page
      And I should see "Learn more" on the page
      And I should see "Register" on the page
