Feature: A registered user visits create activity page
  As a registered user, I should be able to see the create activity page

  Background:
  Given sample data is loaded
    And I am logged in as "joebloggs@test.com"

  @wip

  @poltergeist
  Scenario: A registered user navigates to the create activity page to create activity and add tasks
    When I navigate to "/activities/new"
      Then I should see "Create Activity" on the page
    When I fill in "activity[tasks_attributes][0][learning_objectives]" with "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
      Then I fill in "activity[tasks_attributes][0][learning_objectives]" with "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
      Then I fill in "activity[tasks_attributes][0][hints]" with "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    When I add image to "activity_tasks_attributes_0_image"
      Then I should see "Tag" on the page
