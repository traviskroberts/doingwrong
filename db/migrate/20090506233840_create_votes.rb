class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :entry_id
      t.boolean :doing_it_wrong
      t.timestamps
    end
    
    add_index :votes, :entry_id
  end

  def self.down
    drop_table :votes
  end
end
