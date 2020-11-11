class AddCoordinatesToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :latitude, :float
    add_column :matches, :longitude, :float
  end
end
