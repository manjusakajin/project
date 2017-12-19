class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :introdution
      t.float :web_ratting
      t.float :user_ratting

      t.timestamps
    end
  end
end
