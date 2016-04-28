class AddCoopIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :coop_id, :integer
  end
end
