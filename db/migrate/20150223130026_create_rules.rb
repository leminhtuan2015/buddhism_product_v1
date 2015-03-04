class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.string :description
      t.string :author
      t.string :translator
      t.string :image_link
      t.string :image_upload
      t.string :content

      t.references :rule_store, index: true

      t.timestamps null: false
    end
  end
end
