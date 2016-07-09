class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end
