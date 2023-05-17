class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :tax_excluded_price
      t.boolean :is_status, null: true, default:true

      t.timestamps
    end
  end
end
