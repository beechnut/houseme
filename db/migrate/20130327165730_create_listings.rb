class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :url
      t.string :respond_email
      t.integer :bedrooms
      t.integer :cost
      t.integer :housing_preference_id
      t.integer :user_id

      t.timestamps
    end
  end
end
