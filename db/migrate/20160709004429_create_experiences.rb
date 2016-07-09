class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :company
      t.string :title
      t.text :description
      t.date :start
      t.date :end

      t.timestamps null: false
    end
  end
end
