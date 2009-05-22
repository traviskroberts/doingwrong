Factory.define(:entry) do |x|  
  x.to "Guy at the gym"
  x.message "I think this is what you're doing wrong."
  x.approved true
end

Factory.define(:comment) do |x|
  x.name "John Smith"
  x.message "This is my comment."
  x.association :entry
end