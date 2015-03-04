class CreatePhotoStores < ActiveRecord::Migration
  def change
    create_table :photo_stores do |t|
      t.string :name
      t.string :description
      
      t.timestamps null: false
    end
  end
end
