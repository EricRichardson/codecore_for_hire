class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :link
      t.string :github
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
