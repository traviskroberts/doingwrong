class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user
  
  default_scope :order => 'created_at DESC'
end
