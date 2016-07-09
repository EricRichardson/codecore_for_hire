class AddResumeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :resume, :string
  end
end
