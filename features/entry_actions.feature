Feature: Entry Actions
	In order to interact with entries
	As a user
	I want to be able to vote for entries
	
	Scenario: Vote that they're "Doing It Wrong"
		Given there are 1 entries
		And I am on the homepage
		When I follow "You're doing it wrong"
		Then I should see "You're doing it wrong"
		And I should see "(1)"
		
	Scenario: Vote that it's "Not So Bad"
		Given there are 1 entries
		And I am on the homepage
		When I follow "Not so bad"
		Then I should see "Not so bad"
		And I should see "(1)"

	Scenario: Make sure comment count is correct
		Given there are 1 comments
		When I am on the homepage
		Then I should see "1 comment"
		