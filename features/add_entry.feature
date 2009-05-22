Feature: Add Entry
	In order to contribute entries
	As a user
	I want to be able to submit an entry
	
	Scenario: Submit a valid entry
		Given I am on the homepage
		And I have no entries
		When I follow "Submit an Entry"
		And I fill in "To" with "Guy at the gym"
		And I fill in "This is what they're doing wrong" with "You make a lot of noise when you work out"
		And I press "Submit"
		Then I should see "Your submission has been received and will be reviewed shortly."
		And I should have 1 entry
		
	Scenario: Submit an invalid entry (no fields supplied)
		Given I am on the homepage
		And I have no entries
		When I follow "Submit an Entry"
		And I press "Submit"
		Then I should see "Your submission could not be saved."
		And I should see "To can't be blank"
		And I should see "Message can't be blank"
		
	Scenario: Submit an invalid entry (no to supplied)
		Given I am on the homepage
		And I have no entries
		When I follow "Submit an Entry"
		And I fill in "This is what they're doing wrong" with "You make a lot of noise when you work out"
		And I press "Submit"
		Then I should see "Your submission could not be saved."
		And I should see "To can't be blank"
		
	Scenario: Submit an invalid entry (no message supplied)
		Given I am on the homepage
		And I have no entries
		When I follow "Submit an Entry"
		And I fill in "To" with "Guy at the gym"
		And I press "Submit"
		Then I should see "Your submission could not be saved."
		And I should see "Message can't be blank"
