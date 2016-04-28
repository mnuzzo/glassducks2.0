class AddMajorIdToCoops < ActiveRecord::Migration
  def change
    add_column :coops, :major_id, :integer
  end
end
