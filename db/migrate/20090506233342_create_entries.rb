class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.string  :to
      t.text    :message
      t.boolean :approved, :default => false
      t.timestamps
    end
    
    add_index :entries, :user_id
  end

  def self.down
    drop_table :entries
  end
end
