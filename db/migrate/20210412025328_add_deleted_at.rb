class AddDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :deleted_at, :datetime
    add_index :restaurants, :deleted_at
    # Hero.where('age > 10')
    # select * form heroes where age > 10
  end
end
