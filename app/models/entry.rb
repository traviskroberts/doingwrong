class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  
  default_scope :order => 'updated_at DESC'
  named_scope :approved, :conditions => ["approved = ?", true]
  named_scope :unapproved, :conditions => ["approved = ?", false]
  
  validates_presence_of :to, :message
  
  def positive_vote_count
    self.votes.positive.count
  end
  
  def negative_vote_count
    self.votes.negative.count
  end
  
  def pretty_date
    self.created_at.strftime("%B %d, %Y")
  end
end
