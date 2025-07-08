class CreateBookmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.index %i[user_id meal_id], unique: true
      t.timestamps
    end
  end
end
