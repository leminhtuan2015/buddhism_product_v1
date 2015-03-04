class CreateLectureStores < ActiveRecord::Migration
  def change
    create_table :lecture_stores do |t|
      t.string :name
      t.string :description
      
      t.timestamps null: false
    end
  end
end
