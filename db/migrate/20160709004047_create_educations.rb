class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.string :description
      t.string :school_link
      t.date-time :start
      t.date-time :end

      t.timestamps null: false
    end
  end
end
