Feature: Must log in
  In order to access protected sections of this app
  As a visitor
  I must log in

  Scenario: Visitor is asked to log in
    When I am on the home page
    Then I should see login form

  Scenario Outline: Visitor is redirected to log in
    When I am trying to visit <path>
    Then I should be redirected to login page

    Examples:
      |     path         |
      | projects_path    |
      | new_project_path |
      | admin_users_path |

  # Scenario: Visitor is redirect to log in
  #   When I am using google app to login
  #   And I am logged in already with company's google app
  #   When I click 'No thanks' button
  #   Then I should be redirect to login page with authentication failure message
