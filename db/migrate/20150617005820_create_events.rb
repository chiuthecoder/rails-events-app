class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :speaker
      t.string :title
      t.text :content
      t.datetime :date
      t.string :branch
      t.references :user, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
