class AddUserRestaurant < ActiveRecord::Migration[6.1]
  def change
    # add_column :restaurant, :iser_id, :integer 
    # add_column :restaurant

    add_reference(:restaurants, :user)
  end
end
