class AddSlugToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :slug, :string
  end

  def self.down
    remove_column :entries, :slug
  end
end
