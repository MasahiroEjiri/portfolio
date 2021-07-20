class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :description
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
