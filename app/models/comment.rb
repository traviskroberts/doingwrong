class Comment < ActiveRecord::Base
  belongs_to :entry
  
  default_scope :order => 'created_at'
  
  validates_presence_of :name, :email, :message
  
  before_save :hashify_email
  
  protected
  def hashify_email
    require 'digest/md5'
    self.email = Digest::MD5.hexdigest(email.strip.downcase)
  end
end
