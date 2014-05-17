class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :text
      t.integer :adventure_id

      t.timestamps
    end
  end
end
