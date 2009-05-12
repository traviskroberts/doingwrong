Given /^I have no entries$/ do
  Entry.destroy_all
end

Then /^I should have ([0-9]+) entry$/ do |count|
  Entry.count.should == count.to_i
end