class CreateAdminPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_posts do |t|
      t.references :station, foreign_key: true
      t.integer :data, null: false
      t.string :location, null: false
      t.float :lat, null: false
      t.float :lng, null: false

      t.timestamps
    end
  end
end
