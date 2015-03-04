class CreateOtherItems < ActiveRecord::Migration
  def change
    create_table :other_items do |t|
    	t.string :name

    	t.references :other, index: true

      t.timestamps null: false
    end
  end
end
