Feature: An unregistered user visits activities page
  As an uregistered user, I should be able to see the activites page

  @poltergeist
  Scenario: An unregistered user navigates to the activities page
    When I navigate to "/activities"
      Then I should see "Activities" on the page
