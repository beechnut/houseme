class AddCarrierIdToUser < ActiveRecord::Migration
  def change
    remove_column :users, :carrier
    add_column :users, :carrier_id, :integer
  end
end
