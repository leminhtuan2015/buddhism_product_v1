class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description

      t.references :photo_store, index: true

      t.timestamps null: false
    end
  end
end
