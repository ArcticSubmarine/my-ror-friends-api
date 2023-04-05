class AddReferenceToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :friend, :string
    add_column :houses, :references, :string
  end
end
