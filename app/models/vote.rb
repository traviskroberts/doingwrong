class Vote < ActiveRecord::Base
  belongs_to :entry
  
  named_scope :positive, :conditions => ["doing_it_wrong = ?", false]
  named_scope :negative, :conditions => ["doing_it_wrong = ?", true]
end
