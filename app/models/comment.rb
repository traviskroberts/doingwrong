class Comment < ActiveRecord::Base
  belongs_to :entry
  
  default_scope :order => 'created_at DESC'
  
  validates_presence_of :name, :message
end
