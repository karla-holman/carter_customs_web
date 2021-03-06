class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description
    	t.date :complete_date
      t.timestamps null: false
    end

    add_attachment :projects, :main_image
  end
end
