class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.string :during
      t.string :place
      t.string :content
      t.string :image_link
      t.string :image_upload
      t.string :description

      t.timestamps null: false
    end
  end
end