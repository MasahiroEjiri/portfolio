class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :topic_id], unique: true
    end
  end
end
