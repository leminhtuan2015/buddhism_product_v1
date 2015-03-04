class CreateOtherItemDetails < ActiveRecord::Migration
  def change
    create_table :other_item_details do |t|
      t.string :name
      t.string :source
      t.string :author
      t.string :postor
      t.string :translator
      t.string :during
      t.string :place
      t.string :content
      t.string :image_link
      t.string :image_upload
      t.string :url
      t.string :description
      t.string :status
      t.string :view
      t.string :show
      t.string :params

      t.references :other_item, index: true

      t.timestamps null: false
    end
  end
end
