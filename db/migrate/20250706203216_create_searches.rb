class CreateSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :searches do |t|
      t.string :phrase
      t.references :user, null: false, foreign_key: true

      t.index %i[phrase user_id], unique: true
      t.timestamps
    end
  end
end
