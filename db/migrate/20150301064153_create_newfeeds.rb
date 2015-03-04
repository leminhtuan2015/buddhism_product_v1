class CreateNewfeeds < ActiveRecord::Migration
  def change
    create_table :newfeeds do |t|

    	t.references :other_item_detail, index: true
    	t.references :album, index: true
    	t.references :article, index: true
    	t.references :book, index: true
    	t.references :rule, index: true
    	t.references :lecture, index: true
    	t.references :news, index: true

      t.timestamps null: false
    end
  end
end
