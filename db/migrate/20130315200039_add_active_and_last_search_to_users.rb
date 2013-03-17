class AddActiveAndLastSearchToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean, default: true
    add_column :users, :last_search, :datetime
  end
end
