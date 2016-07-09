class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :twitter
      t.string :linkedin
      t.string :github

      t.timestamps null: false
    end
  end
end
