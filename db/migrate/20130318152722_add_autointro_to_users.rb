class AddAutointroToUsers < ActiveRecord::Migration
  def change
    add_column :users, :autointro, :text
  end
end
