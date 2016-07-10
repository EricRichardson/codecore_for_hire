class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :body
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
