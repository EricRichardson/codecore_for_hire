class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :school
      t.text :description
      t.string :link
      t.date :start
      t.date :end

      t.timestamps null: false
    end
  end
end
