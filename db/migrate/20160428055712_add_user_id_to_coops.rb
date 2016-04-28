class AddUserIdToCoops < ActiveRecord::Migration
  def change
    add_column :coops, :user_id, :integer
  end
end
