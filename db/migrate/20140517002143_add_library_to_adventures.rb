class AddLibraryToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :library, :references
  end
end
