Feature: A registered user visits home page
  As a registered user, I should be able to see the home page

  Background:
  Given sample data is loaded
    And I am logged in as "joebloggs@test.com"

  @poltergeist
  Scenario: A registered user navigates to the home page
    When I navigate to "/home"
    Then I should see "Blender" on the page
      And I should see "Home" on the page
      And I should see "Activities" on the page
      And I should see "Dashboard" on the page
      And I should see "Log out" on the page
      And I should see "Lorem Ipsum" on the page
      And I should see "Learn more" on the page
      And I should see "Cosmos" on the page
