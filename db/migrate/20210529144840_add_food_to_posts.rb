class AddFoodToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :food, :string
  end
end
