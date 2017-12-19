class CreateRatingCaches < ActiveRecord::Migration
  class << self
    def up
      create_table :rating_caches do |t|
        t.belongs_to :cacheable, polymorphic: true
        t.float :avg, null: false
        t.integer :qty, null: false
        t.string :dimension
        t.timestamps
      end
      add_index :rating_caches, [:cacheable_id, :cacheable_type]
    end

    def down
      drop_table :rating_caches
    end
  end
end