Feature: booking.com App first feature

  the next scenarios correspond to the main page or activity of the booking.com application
#@wip
Scenario: search Close to USA
  Given I Open Booking.com search screen
  When I tap on the "current location" input field
   And I fill in enter destination input with "Little Havana"
   And I select a date
   And I click on Let's go
  Then I should see "Little Havana Caffe & Apartments" in the result list

  #Scenario Outline: Verify that modification done in More Option are apply in the search.
  Scenario Outline: Search according to number of room, adults and children.
    Given I Open Booking.com search screen
    When I tap on the "current location" input field
    And I fill in enter destination input with "Little Havana"
    And I select a date
    And I choice room on "<Room>" from More options
    And I choice adults on "<Adults>" from More options
    And I choice children on "<Children>" from More options
    And I click on Let's go
    Then I should see "Little Havana Caffe & Apartments" with "<Room>" and "<Adults>" "<Children>" choice previously
  Examples:
    | Room | Adults | Children |
    |2     |3       |1         |

  Scenario Outline: Verify that modification done in Travelling are apply in the search.
      Given I Open Booking.com search screen
      When I tap on the "current location" input field
      And I fill in enter destination input with "Little Havana"
      And I select a date
      And I choice "<Travelling>" from Main menu
      And I click on Let's go
      Then I should see "Little Havana Caffe & Apartments" with "<Travelling>" option choice previously
  Examples:
    | Travelling |
    |business    |
    |leisure     |
