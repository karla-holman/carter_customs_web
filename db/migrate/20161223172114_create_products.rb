class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title, null: false
    	t.string :slug, null: false
    	t.text :description
    	t.references :user, null: false

    	t.boolean :is_featured, null: false, default: false

    	t.timestamps null: false
    end

    add_attachment :products, :images
  end
end
