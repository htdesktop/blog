class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :path, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end
  end
end
