class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :entry_id
      t.integer :user_id
      t.boolean :doing_it_wrong
      t.timestamps
    end
    
    add_index :votes, :entry_id
    add_index :votes, :user_id
  end

  def self.down
    drop_table :votes
  end
end
