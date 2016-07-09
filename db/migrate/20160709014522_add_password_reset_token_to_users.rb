class AddPasswordResetTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reset_token, :string
    add_column :users, :sent_at, :datetime
  end
end
