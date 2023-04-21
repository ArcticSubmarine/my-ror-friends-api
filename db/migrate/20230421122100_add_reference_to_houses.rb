class AddReferenceToHouses < ActiveRecord::Migration[7.0]
  def change
    add_reference :houses, :friend, null: false, foreign_key: true
  end
end
