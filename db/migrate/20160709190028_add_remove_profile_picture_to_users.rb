class AddRemoveProfilePictureToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_picture, :string
  end
end
