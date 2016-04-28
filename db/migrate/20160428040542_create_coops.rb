class CreateCoops < ActiveRecord::Migration
  def change
    create_table :coops do |t|
      t.string :title
      t.text :description
      t.string :company

      t.timestamps null: false
    end
  end
end
