class CreateHousingPreferences < ActiveRecord::Migration
  def change
    create_table :housing_preferences do |t|
      t.integer :user_id
      t.integer :city_id
      t.string :housing_type
      t.integer :neighborhood
      t.integer :min_rent
      t.integer :max_rent
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :additional_search_terms

      t.timestamps
    end
  end
end
