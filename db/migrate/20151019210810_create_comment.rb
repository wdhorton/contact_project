class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
