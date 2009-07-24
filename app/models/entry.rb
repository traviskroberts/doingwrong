class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes
  
  default_scope :order => 'updated_at DESC'
  named_scope :approved, :conditions => ["approved = ?", true]
  named_scope :unapproved, :conditions => ["approved = ?", false]
  
  before_save :create_slug
  
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
  
  protected
    def create_slug
      self.slug = 'to-' + self.to.gsub(/\s+/,'-').gsub(/[^a-z0-9\-]+/i, '').gsub(/[\-]+/,'-').downcase
    end
end
