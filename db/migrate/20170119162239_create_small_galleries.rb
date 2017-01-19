class CreateSmallGalleries < ActiveRecord::Migration
  def change
    create_table :small_galleries do |t|
      t.string :title
      t.boolean :enabled, null: false, default: true
      t.timestamps null: false
    end

    add_attachment :small_galleries, :main_image
  end
end
