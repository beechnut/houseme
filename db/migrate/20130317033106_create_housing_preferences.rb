class CreateHousingPreferences < ActiveRecord::Migration
  def change
    create_table :housing_preferences do |t|
      t.integer :user_id
      t.integer :city_id
      t.integer :neighborhood
      t.string :apartment_type
      t.string :additional_search_terms
      t.string :bedrooms
      t.string :bathrooms
      t.integer :min_rent
      t.integer :max_rent

      t.timestamps
    end
  end
end
