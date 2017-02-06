Feature: A registered user visits create activity page
  As a registered user, I should be able to see the create activity page

  Background:
  Given sample data is loaded
    And I am logged in as "joebloggs@test.com"



  @poltergeist
  Scenario: A registered user navigates to the create activity page to create activity then edit it
    When I navigate to "/activities/new"
      Then I should see "Create Activity" on the page
    When I fill in "activity[title]" with "This is a test title"
      Then I fill in "activity[description]" with "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    When I click "Save activity"
      Then I should see "Image can't be blank" on the page
    When I add image to "activity_image"
      Then I click "Save activity"
      And I should see "Activity has been successfully created." on the page
    When I click "Edit"
      Then I should see "Editing Activity" on the page
    When I fill in "activity[title]" with "This is a new title"
      Then I click "Save activity"
      And I should see "Activity has been successfully updated." on the page
