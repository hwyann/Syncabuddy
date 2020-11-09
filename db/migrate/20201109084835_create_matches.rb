class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.text :description
      t.string :location
      t.string :sport
      t.integer :min_attendent
      t.integer :max_attendent

      t.timestamps
    end
  end
end
