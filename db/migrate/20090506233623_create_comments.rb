class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :entry_id
      t.string  :name
      t.text    :message
      t.timestamps
    end
    
    add_index :comments, :entry_id
  end

  def self.down
    drop_table :comments
  end
end
