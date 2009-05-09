class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  
  default_scope :order => 'updated_at DESC'
  named_scope :approved, :conditions => ["approved = ?", true]
  named_scope :unapproved, :conditions => ["approved = ?", false]
  
  def positive_vote_count
    self.votes.positive.count
  end
  
  def negative_vote_count
    self.votes.negative.count
  end
end
