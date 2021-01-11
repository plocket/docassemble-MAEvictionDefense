Feature: MADE tests

Scenario: User's court date has passed
  Given I start the interview at "eviction"
  And the user gets to "explain pronouns" with this data:
    | var | choice | value |
    | acknowledged_information_use | user_accepts | true |
    | person_answering |  | attorney |
    | representation_type | ghostwriting |  |
 
