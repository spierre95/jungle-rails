class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.references :product
      t.references :user

      t.timestamps null: false
    end
  end
end
