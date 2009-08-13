class AddTweetedToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :has_tweeted, :boolean, :default => false
    
    Entry.all.each { |x| x.update_attribute(:has_tweeted, true) }
  end

  def self.down
    remove_column :entries, :has_tweeted
  end
end
