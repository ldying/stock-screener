class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
