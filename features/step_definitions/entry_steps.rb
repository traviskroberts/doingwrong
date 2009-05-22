Given /^I have no entries$/ do
  Entry.destroy_all
end

Then /^I should have ([0-9]+) entry$/ do |n|
  Entry.count.should == n.to_i
end

Given /^there are (\d+) (.+)$/ do |n, model_str|
  model_str = model_str.gsub(/\s/, '_').singularize
  model_sym = model_str.to_sym
  klass = eval(model_str.camelize)
  klass.transaction do
    klass.destroy_all
    n.to_i.times do |i|
      Factory(model_sym)
    end
  end
end