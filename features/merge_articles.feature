Feature: Merge Articles
  As an admin
  In order to group similar articles on the same topic
  I want to merge the content of two articles into a single article

  Background:
    Given the blog is set up
    And there is a user
    And they have published articles:
      | title       | body                                     |
      | "Article 1" | "The body of the first article"          |
      | "Article 2" | "The similar body of the second article" |

  Scenario: Blog user can see own posts
    Given I am a logged in user
    When  I am on the home page
    Then  I should see "Article 1"
    And   I should see "Article 2"

  Scenario: Article Merging form is not shown for non-admin user
    Given I am a logged in user
    When  I follow "All Articles"
    And   I follow "Article 1"
    Then  I should not see "Merge Articles"

  Scenario: Admin can see Merge Articles form
    Given I am logged into the admin panel
    When  I follow "All Articles"
    And   I follow "Article 1"
    Then  I should see "Merge Articles"

  Scenario: Admin cannot see Merge Articles form when creating a New Article
    Given I am logged into the admin panel
    And   I follow "New Article"
    Then  I should not see "Merge Articles"

