class AddMajorColumnToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :major, :string
  end
end
